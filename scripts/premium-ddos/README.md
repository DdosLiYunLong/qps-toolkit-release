# ⚡ Quantum Strike - 量子级打击系统

125 并发超核心攻击引擎，专为 HTTP/1.1 优化。

## 🚀 快速开始

```bash
cd premium-ddos
./quantum-strike <URL> <代理文件> <时间>
```

**示例:**
```bash
./quantum-strike https://target.com ../../config/proxies/global.txt 60
```

## 📦 组成部分

### 1. quantum-strike (启动脚本)
自动启动 125 个并发进程的 bash 脚本。

### 2. hyper-core.js (核心引擎)
单个攻击进程的核心引擎。

## ⚙️  参数说明

| 参数 | 说明 | 示例 |
|------|------|------|
| URL | 目标地址 | https://target.com |
| 代理文件 | 代理列表路径 | ../../config/proxies/global.txt |
| 时长 | 攻击时间（秒）| 60 |

## 🎯 适用场景

- ✅ HTTP/1.1 协议目标
- ✅ 需要高并发攻击
- ✅ 代理资源充足
- ✅ Nginx / Apache 服务器

## 📊 性能特点

- **并发数**: 125 进程
- **协议**: HTTP/1.1 + TCP 优化
- **速率**: 自动调整
- **稳定性**: 自动错误处理
- **输出**: 实时状态显示

## 🌟 核心优势

1. **超高并发** - 125 个独立进程
2. **智能代理** - 自动轮换代理
3. **实时监控** - 彩色状态输出
4. **稳定可靠** - 错误自动恢复
5. **易于使用** - 一条命令启动

## 💡 使用建议

### 推荐配置
```bash
# 中等强度
./quantum-strike https://target.com ../../config/proxies/global.txt 60

# 高强度攻击
./quantum-strike https://target.com ../../config/proxies/global.txt 300
```

### 代理要求
- 最少: 100 个代理
- 推荐: 1000+ 个代理
- 格式: IP:PORT (每行一个)

## 🔧 故障排除

**问题: 没有输出**
- 检查代理文件路径是否正确
- 确保代理格式为 IP:PORT

**问题: 请求失败率高**
- 更换代理列表
- 降低并发数（修改脚本中的 125）

**问题: 内存占用高**
- 正常现象，125 进程会占用较多内存
- 建议服务器内存 ≥ 4GB

## 📖 详细文档

查看快速入门: [QUICKSTART.txt](./QUICKSTART.txt)

---

**推荐指数**: ★★★★★  
**适用目标**: HTTP/1.1 服务器  
**技术等级**: 企业级
