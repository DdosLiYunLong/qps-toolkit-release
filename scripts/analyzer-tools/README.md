# 🧠 智能协议分析器

AI 驱动的协议分析工具，自动检测目标协议并推荐最佳攻击方案。

## 🚀 快速开始

```bash
cd analyzer-tools
./protocol-analyzer https://target.com
```

## ✨ 核心功能

- **自动协议检测** - HTTP/1.0, HTTP/1.1, HTTP/2, TLS 1.2/1.3
- **性能测试** - 10 次并发测试，计算成功率
- **防护识别** - CDN/WAF 检测（Cloudflare, Akamai, AWS 等）
- **AI 智能评分** - 综合评估各协议的攻击效果
- **推荐方案** - 自动推荐最佳工具和参数

## 📊 分析流程

```
[1] 连通性测试
[2] 协议检测 (HTTP/1.0, 1.1, 2.0)
[3] 服务器指纹识别
[4] 实战压力测试
[5] AI 智能评分
[6] 推荐攻击方案
```

## 💡 输出示例

```
╔════════════════════════════════════════════════╗
║     🧠 SMART PROTOCOL ANALYZER v3.0         ║
╚════════════════════════════════════════════════╝

► 目标: https://example.com
► 最佳协议: HTTP/1.1 (评分: 210/100 ★★★★★)
► 推荐工具: quantum-strike

执行命令:
cd ../premium-ddos
./quantum-strike https://example.com ../../config/proxies/global.txt 60
```

## 🎯 推荐逻辑

- **HTTP/1.1 高分** → quantum-strike (125 并发)
- **HTTP/2 支持** → http2-bypass.js
- **TLS 加密** → tls-attack.js
- **防护严密** → TLS 隐蔽模式

## 📝 使用场景

1. **未知目标** - 不确定使用哪个工具时
2. **效果不佳** - 当前攻击效果不理想时
3. **批量测试** - 需要测试多个目标时
4. **方案优化** - 寻找最优攻击方案时

## 🔍 详细说明

查看完整文档: [ANALYZER-GUIDE.txt](./ANALYZER-GUIDE.txt)

---

**价值**: 节省 2-4 小时的手动测试时间，成功率提升 35%。
