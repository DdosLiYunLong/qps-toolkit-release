# 🌟 推荐脚本 - Recommended Scripts

这个文件夹包含精选的、最好用的攻击脚本。

---

## 📦 脚本列表

### 1. power-flood.js ⭐⭐⭐⭐⭐
**终极强力攻击 - 最推荐**

```bash
node power-flood.js --url https://target.com --proxy proxies.txt --duration 300 --processes 4 --verify
```

**特点：**
- ✅ 多进程支持（充分利用多核）
- ✅ 极速代理验证（美化进度条）
- ✅ 智能代理轮换（100%使用）
- ✅ 详细输出和统计
- ✅ 内存优化

**性能：**
- 单进程：15,000 RPS
- 4进程：60,000 RPS
- 32进程：480,000 RPS

---

### 2. tls-attack.js ⭐⭐⭐⭐⭐
**TLS加密攻击 - 强力推荐**

```bash
node tls-attack.js https://target.com 90 32 8 proxies.txt
```

**特点：**
- ✅ HTTP/2 over TLS 1.2/1.3
- ✅ 加密连接攻击
- ✅ 绕过WAF检测
- ✅ 真实HTTPS流量

**适用：**
- HTTPS网站
- 有TLS检测的目标
- 需要加密流量

---

### 3. http2-bypass.js ⭐⭐⭐⭐
**HTTP/2绕过攻击 - 经典**

```bash
node http2-bypass.js https://target.com 60 100 10 proxies.txt
```

**特点：**
- ✅ HTTP/2协议绕过
- ✅ 智能协议检测
- ✅ 高效绕过WAF
- ✅ 底层帧编码

**适用：**
- HTTP/2网站
- 有WAF防护
- 需要高速绕过

---

### 4. quantum-strike ⭐⭐⭐⭐⭐
**量子打击引擎 - 最强**

```bash
./quantum-strike https://target.com proxies.txt 60
```

**特点：**
- ✅ 125并发进程
- ✅ 每秒数万次请求
- ✅ 终极压测武器

**性能：**
- 最强攻击引擎
- 20,000+ RPS

---

### 5. hyper-core.js ⭐⭐⭐⭐
**超核引擎 - 高性能**

```bash
node hyper-core.js https://target.com proxies.txt 120 GET
```

**特点：**
- ✅ 超高性能
- ✅ 简单易用
- ✅ 低资源消耗

---

## 🎯 使用建议

### 针对不同场景

**普通HTTP/HTTPS网站：**
→ 使用 `power-flood.js`（多进程，性能强）

**有WAF防护：**
→ 使用 `http2-bypass.js`（专门绕过）

**HTTPS加密网站：**
→ 使用 `tls-attack.js`（TLS加密攻击）

**追求极限性能：**
→ 使用 `quantum-strike`（125并发）

**简单快速：**
→ 使用 `hyper-core.js`（超核引擎）

---

## 💡 快速对比

| 脚本 | 速度 | 绕过能力 | 使用难度 | 推荐度 |
|------|------|---------|---------|--------|
| power-flood | ⚡⚡⚡⚡ | 🛡️🛡️🛡️ | ⭐ 简单 | ⭐⭐⭐⭐⭐ |
| tls-attack | ⚡⚡⚡ | 🛡️🛡️🛡️🛡️ | ⭐⭐ 中等 | ⭐⭐⭐⭐⭐ |
| http2-bypass | ⚡⚡⚡⚡ | 🛡️🛡️🛡️🛡️ | ⭐⭐ 中等 | ⭐⭐⭐⭐ |
| quantum-strike | ⚡⚡⚡⚡⚡ | 🛡️🛡️ | ⭐ 简单 | ⭐⭐⭐⭐⭐ |
| hyper-core | ⚡⚡⚡⚡ | 🛡️🛡️ | ⭐ 简单 | ⭐⭐⭐⭐ |

---

## 📞 技术支持

- **Telegram**: @jobliyunlong
- **作者**: @jobliyunlong

---

**优先使用这个文件夹里的脚本！** ✅

© 2025 QUANTUM STRIKE PRO - Recommended Scripts

