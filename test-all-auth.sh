#!/bin/bash

# ============================================================================
# 授权验证全面测试脚本
# ============================================================================

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 计数器
TOTAL=0
PASSED=0
FAILED=0

echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║          授权验证全面测试 - Authorization Test Suite          ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# ============================================================================
# 第一步：构建发布版本
# ============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}第一步：构建发布版本 (Building Release)${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

echo -e "${BLUE}执行命令: npm run build${NC}"
npm run build

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ 构建成功！${NC}"
else
    echo ""
    echo -e "${RED}❌ 构建失败！终止测试${NC}"
    exit 1
fi

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}第二步：测试源码版本授权验证${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# 创建临时代理文件
echo "127.0.0.1:8080" > /tmp/test-proxy.txt

# 测试函数
test_script() {
    local script_path=$1
    local script_name=$2
    local args=$3
    
    TOTAL=$((TOTAL + 1))
    
    echo -e "${CYAN}测试 $TOTAL: ${script_name}${NC}"
    
    # 运行脚本，捕获输出
    output=$(node $script_path $args 2>&1 | head -20)
    
    # 检查是否包含授权验证失败的关键字
    if echo "$output" | grep -q "授权验证失败\|授权已被禁用\|授权已过期"; then
        echo -e "  ${GREEN}✅ 正确 - 授权验证生效${NC}"
        PASSED=$((PASSED + 1))
    elif echo "$output" | grep -q "Cannot find module.*auth-client"; then
        echo -e "  ${RED}❌ 错误 - 缺少授权模块${NC}"
        FAILED=$((FAILED + 1))
    elif echo "$output" | grep -q "Example:\|Usage:\|用法"; then
        echo -e "  ${RED}❌ 错误 - 直接显示用法（授权被绕过）${NC}"
        echo -e "  ${YELLOW}输出：${NC}"
        echo "$output" | head -5 | sed 's/^/    /'
        FAILED=$((FAILED + 1))
    else
        echo -e "  ${RED}❌ 错误 - 未知响应${NC}"
        echo -e "  ${YELLOW}输出：${NC}"
        echo "$output" | head -5 | sed 's/^/    /'
        FAILED=$((FAILED + 1))
    fi
}

# ============================================================================
# 测试所有脚本 - 源码版本
# ============================================================================

echo -e "${BLUE}【推荐脚本 - Recommended】${NC}"
test_script "scripts/recommended/http2-bypass.js" "http2-bypass.js" "--url https://test.com --proxy /tmp/test-proxy.txt --duration 60"
test_script "scripts/recommended/hyper-core.js" "hyper-core.js" "http://test.com /tmp/test-proxy.txt 60 GET"
test_script "scripts/recommended/power-flood.js" "power-flood.js" "--url https://test.com --proxy /tmp/test-proxy.txt --duration 60"
test_script "scripts/recommended/tls-attack.js" "tls-attack.js" "https://test.com 60 32 8 /tmp/test-proxy.txt"

echo ""
echo -e "${BLUE}【HTTP 攻击脚本 - HTTP Attacks】${NC}"
test_script "scripts/http-attacks/power-flood.js" "power-flood.js" "--url https://test.com --proxy /tmp/test-proxy.txt --duration 60"
test_script "scripts/http-attacks/http2-bypass.js" "http2-bypass.js" "--url https://test.com --proxy /tmp/test-proxy.txt --duration 60"
test_script "scripts/http-attacks/http-methods.js" "http-methods.js" ""
test_script "scripts/http-attacks/http-flood.js" "http-flood.js" ""
test_script "scripts/http-attacks/layer7-flooder.js" "layer7-flooder.js" ""
test_script "scripts/http-attacks/distributed-attack.js" "distributed-attack.js" ""
test_script "scripts/http-attacks/post-get-attack.js" "post-get-attack.js" ""

echo ""
echo -e "${BLUE}【TLS 攻击脚本 - TLS Attacks】${NC}"
test_script "scripts/tls-attacks/tls-attack.js" "tls-attack.js" "https://test.com 60 32 8 /tmp/test-proxy.txt"

echo ""
echo -e "${BLUE}【TCP 攻击脚本 - TCP Attacks】${NC}"
test_script "scripts/tcp-attacks/cc-mod.js" "cc-mod.js" ""

echo ""
echo -e "${BLUE}【高级攻击脚本 - Premium DDoS】${NC}"
test_script "scripts/premium-ddos/hyper-core.js" "hyper-core.js" "http://test.com /tmp/test-proxy.txt 60 GET"

# ============================================================================
# 第三步：测试发布版本
# ============================================================================
echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}第三步：测试发布版本授权验证 (qps-release)${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ -d "qps-release" ]; then
    cd qps-release
    
    echo -e "${BLUE}【发布版本 - 推荐脚本】${NC}"
    test_script "scripts/recommended/http2-bypass.js" "http2-bypass.js (发布版)" "--url https://test.com --proxy /tmp/test-proxy.txt --duration 60"
    test_script "scripts/recommended/hyper-core.js" "hyper-core.js (发布版)" "http://test.com /tmp/test-proxy.txt 60 GET"
    test_script "scripts/recommended/power-flood.js" "power-flood.js (发布版)" "--url https://test.com --proxy /tmp/test-proxy.txt --duration 60"
    test_script "scripts/recommended/tls-attack.js" "tls-attack.js (发布版)" "https://test.com 60 32 8 /tmp/test-proxy.txt"
    
    cd ..
else
    echo -e "${YELLOW}⚠️  qps-release 目录不存在，跳过发布版本测试${NC}"
fi

# ============================================================================
# 清理
# ============================================================================
rm -f /tmp/test-proxy.txt

# ============================================================================
# 统计结果
# ============================================================================
echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║                        测试结果汇总                            ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  总计测试: ${BLUE}${TOTAL}${NC} 个"
echo -e "  ${GREEN}✅ 通过: ${PASSED}${NC} 个"
echo -e "  ${RED}❌ 失败: ${FAILED}${NC} 个"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║          🎉 所有测试通过！授权系统100%正常！ 🎉             ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════════════╝${NC}"
    exit 0
else
    SUCCESS_RATE=$(echo "scale=2; $PASSED * 100 / $TOTAL" | bc)
    echo -e "${YELLOW}╔════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}║          ⚠️  部分测试失败 (通过率: ${SUCCESS_RATE}%)              ║${NC}"
    echo -e "${YELLOW}╚════════════════════════════════════════════════════════════════════╝${NC}"
    exit 1
fi

