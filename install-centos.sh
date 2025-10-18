#!/bin/bash
###############################################################################
# QPS Toolkit 一键安装脚本 - CentOS 7.6+ / 8+
###############################################################################
# 
# 功能：
# - 自动安装 Git, NVM, Node.js, npm
# - 自动克隆 QPS Toolkit
# - 自动安装依赖
# - 一键完成所有配置
#
# 使用方法：
# curl -fsSL https://raw.githubusercontent.com/DdosLiYunLong/qps-toolkit-release/main/install-centos.sh | bash
#
###############################################################################

set -e  # 遇到错误立即退出

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 打印横幅
print_banner() {
    cat << "EOF"
╔════════════════════════════════════════════════════════════════════╗
║          🚀 QPS Toolkit 一键安装脚本 - CentOS              ║
╚════════════════════════════════════════════════════════════════════╝
EOF
    echo ""
}

# 检查是否为 root 用户
check_root() {
    if [ "$EUID" -eq 0 ]; then
        log_warning "不建议使用 root 用户运行，将以当前用户继续..."
    fi
}

# 检查系统版本
check_system() {
    log_info "检查系统版本..."
    
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
        log_info "系统: $OS $VER"
    elif [ -f /etc/redhat-release ]; then
        OS=$(cat /etc/redhat-release)
        log_info "系统: $OS"
    else
        log_error "无法识别系统版本"
        exit 1
    fi
    
    if [[ "$OS" != *"CentOS"* ]] && [[ "$OS" != *"Red Hat"* ]] && [[ "$OS" != *"Rocky"* ]]; then
        log_warning "此脚本为 CentOS/RHEL 设计，当前系统：$OS"
        read -p "是否继续？(y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# 更新系统
update_system() {
    log_info "更新系统软件包..."
    
    # 检测是使用 yum 还是 dnf
    if command -v dnf &> /dev/null; then
        PKG_MANAGER="dnf"
    else
        PKG_MANAGER="yum"
    fi
    
    sudo $PKG_MANAGER update -y -q
    log_success "系统更新完成"
}

# 安装基础工具
install_basics() {
    log_info "安装基础工具 (curl, wget, git, gcc-c++, make)..."
    
    if command -v dnf &> /dev/null; then
        sudo dnf install -y curl wget git gcc-c++ make > /dev/null 2>&1
    else
        sudo yum install -y curl wget git gcc-c++ make > /dev/null 2>&1
    fi
    
    log_success "基础工具安装完成"
}

# 安装 NVM
install_nvm() {
    log_info "检查 NVM..."
    
    if [ -d "$HOME/.nvm" ]; then
        log_warning "NVM 已安装，跳过..."
        return
    fi
    
    log_info "安装 NVM (Node Version Manager)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash > /dev/null 2>&1
    
    # 加载 NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    log_success "NVM 安装完成"
}

# 安装 Node.js
install_nodejs() {
    log_info "安装 Node.js 20.19.5..."
    
    # 加载 NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    # 安装 Node.js
    nvm install 20.19.5 > /dev/null 2>&1
    nvm use 20.19.5
    nvm alias default 20.19.5
    
    NODE_VERSION=$(node --version)
    NPM_VERSION=$(npm --version)
    
    log_success "Node.js $NODE_VERSION 安装完成"
    log_success "npm $NPM_VERSION 安装完成"
}

# 克隆 QPS Toolkit
clone_qps() {
    log_info "克隆 QPS Toolkit..."
    
    INSTALL_DIR="$HOME/qps-toolkit-release"
    
    if [ -d "$INSTALL_DIR" ]; then
        log_warning "目录已存在: $INSTALL_DIR"
        read -p "是否删除并重新克隆？(y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$INSTALL_DIR"
        else
            log_info "跳过克隆，使用现有目录"
            return
        fi
    fi
    
    git clone https://github.com/DdosLiYunLong/qps-toolkit-release.git "$INSTALL_DIR" > /dev/null 2>&1
    log_success "QPS Toolkit 克隆完成"
}

# 安装依赖
install_dependencies() {
    log_info "安装 Node.js 依赖..."
    
    INSTALL_DIR="$HOME/qps-toolkit-release"
    cd "$INSTALL_DIR"
    
    # 加载 NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    npm install > /dev/null 2>&1
    log_success "依赖安装完成"
}

# 配置防火墙（可选）
configure_firewall() {
    log_info "检查防火墙配置..."
    
    if systemctl is-active --quiet firewalld; then
        log_warning "防火墙正在运行"
        read -p "是否停止防火墙（建议测试环境停止）？(y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo systemctl stop firewalld
            sudo systemctl disable firewalld
            log_success "防火墙已停止"
        else
            log_info "保持防火墙运行"
        fi
    else
        log_info "防火墙未运行"
    fi
}

# 系统优化（可选）
optimize_system() {
    log_info "应用系统优化..."
    
    # 临时优化
    ulimit -n 65535 2>/dev/null || true
    
    # 询问是否永久优化
    read -p "是否应用永久系统优化（提升性能）？(y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # 优化文件描述符
        sudo bash -c 'cat >> /etc/security/limits.conf << EOL
* soft nofile 65535
* hard nofile 65535
EOL'
        
        # 优化网络参数
        sudo bash -c 'cat >> /etc/sysctl.conf << EOL
net.ipv4.tcp_fin_timeout=30
net.ipv4.tcp_tw_reuse=1
net.core.somaxconn=65535
EOL'
        
        sudo sysctl -p > /dev/null 2>&1
        log_success "系统优化已应用"
    else
        log_info "跳过系统优化"
    fi
}

# 测试安装
test_installation() {
    log_info "测试安装..."
    
    INSTALL_DIR="$HOME/qps-toolkit-release"
    cd "$INSTALL_DIR"
    
    # 加载 NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    # 测试协议分析器
    if node scripts/analyzer-tools/protocol-analyzer --help > /dev/null 2>&1; then
        log_success "安装测试通过！"
    else
        log_warning "测试失败，但安装已完成，请手动测试"
    fi
}

# 打印完成信息
print_completion() {
    echo ""
    cat << "EOF"
╔════════════════════════════════════════════════════════════════════╗
║                    ✅ 安装完成！                               ║
╚════════════════════════════════════════════════════════════════════╝
EOF
    echo ""
    log_success "QPS Toolkit 已安装到: $HOME/qps-toolkit-release"
    echo ""
    echo "📋 已安装的软件："
    echo "   • Git: $(git --version)"
    echo "   • NVM: $(nvm --version 2>/dev/null || echo 'installed')"
    echo "   • Node.js: $(node --version)"
    echo "   • npm: $(npm --version)"
    echo ""
    echo "🚀 快速开始："
    echo ""
    echo "   # 进入目录"
    echo "   cd $HOME/qps-toolkit-release"
    echo ""
    echo "   # 查看文档"
    echo "   cat README.md"
    echo ""
    echo "   # 测试协议分析器"
    echo "   node scripts/analyzer-tools/protocol-analyzer --help"
    echo ""
    echo "   # HTTP/2 绕过攻击"
    echo "   node scripts/recommended/http2-bypass.js \\"
    echo "     --url https://target.com \\"
    echo "     --proxy config/proxies/global.txt \\"
    echo "     --duration 300 \\"
    echo "     --processes 4 \\"
    echo "     --verify"
    echo ""
    echo "📖 详细文档："
    echo "   • 安装指南: cat INSTALL.md"
    echo "   • 脚本索引: cat scripts/INDEX.md"
    echo "   • 快速开始: cat scripts/premium-ddos/QUICKSTART.txt"
    echo ""
    echo "📞 技术支持："
    echo "   • Telegram: @jobliyunlong"
    echo "   • 响应时间: 5 分钟内"
    echo ""
    echo "⚠️  重要提示："
    echo "   如果 'nvm' 或 'node' 命令找不到，请运行："
    echo "   source ~/.bashrc"
    echo "   或重新打开终端"
    echo ""
    cat << "EOF"
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ 安装成功！祝您使用愉快！
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
}

# 主函数
main() {
    print_banner
    check_root
    check_system
    update_system
    install_basics
    install_nvm
    install_nodejs
    clone_qps
    install_dependencies
    configure_firewall
    optimize_system
    test_installation
    print_completion
}

# 运行主函数
main

