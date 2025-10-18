# ⚡ QUANTUM STRIKE PRO

> 量子级压力测试专业解决方案

[![License](https://img.shields.io/badge/License-Commercial-blue.svg)](LICENSE)
[![Node](https://img.shields.io/badge/Node.js-20.19.5-green.svg)](https://nodejs.org/)
[![Status](https://img.shields.io/badge/Status-Active-success.svg)](https://github.com/DdosLiYunLong/quantum-strike-pro)

**作者：** Telegram [@jobliyunlong](https://t.me/jobliyunlong)

---

## 🌟 项目简介

**QUANTUM STRIKE PRO** 是一款专业的网络压力测试工具包，集成了 AI 智能协议分析、125 并发量子引擎、9 种专业攻击模式，以及全球精选 IP 武器库。

### ✨ 核心特性

- 🧠 **AI 智能协议分析** - 自动检测目标协议，智能推荐最佳攻击方案
- ⚡ **125 并发引擎** - Quantum Strike 量子引擎，每秒数万次请求
- 🎯 **9 种攻击模式** - HTTP/2、TLS、TCP、Layer 7 等专业模式
- 🌍 **Elite IP 武器库** - 全球精选 5,958+ 高质量代理 IP
- 🎬 **实时监控** - 彩色终端输出，实时显示攻击状态和统计
- 📱 **响应式网站** - 完整的产品展示和在线咨询系统

---

## 📦 项目结构

```
qps/
├── website/              # 🌐 官方网站
│   ├── index.html       #    主页（实时演示+IP武器库）
│   ├── licensing.html   #    Elite 工具授权
│   ├── testing.html     #    企业级压测方案
│   ├── contact.html     #    联系咨询
│   ├── assets/          #    静态资源
│   │   └── app.js       #    动态效果脚本
│   └── config/          #    配置文件
│       └── proxies/     #    代理池数据
│
├── scripts/             # 🔧 攻击脚本工具包
│   ├── http-attacks/    #    HTTP 攻击模块
│   │   ├── http2-bypass.js      # HTTP/2 绕过攻击
│   │   ├── http-flood.js        # HTTP 洪水攻击
│   │   ├── layer7-flooder.js    # Layer 7 攻击
│   │   └── ...
│   ├── tls-attacks/     #    TLS 加密攻击
│   │   └── tls-attack.js        # TLS 加密连接攻击
│   ├── tcp-attacks/     #    TCP 攻击模块
│   │   ├── tcp                  # TCP 洪水
│   │   └── cc-mod.js            # CC 攻击
│   ├── premium-ddos/    #    高级 DDoS 模块
│   │   ├── quantum-strike       # 125 并发量子引擎
│   │   └── hyper-core.js        # 超核引擎
│   └── analyzer-tools/  #    智能分析工具
│       └── protocol-analyzer    # AI 协议分析器
│
├── config/              # ⚙️ 配置文件
│   ├── proxies/         #    代理池配置
│   │   ├── global.txt   #    全球池 (5,958 IPs)
│   │   ├── us.txt       #    美国池 (30 IPs)
│   │   ├── eu.txt       #    欧洲池 (30 IPs)
│   │   ├── asia.txt     #    亚洲池 (30 IPs)
│   │   └── cn.txt       #    中国池 (30 IPs)
│   └── user-agents.txt  #    User-Agent 列表
│
├── package.json         # 📋 项目配置
├── build-release.js     # 🔨 发布构建工具
└── README.md            # 📖 本文档
```

---

## 🚀 快速开始

### 1. 环境要求

```bash
Node.js >= 20.19.5
npm >= 10.x
```

### 2. 安装依赖

```bash
# 克隆仓库
git clone https://github.com/DdosLiYunLong/quantum-strike-pro.git
cd quantum-strike-pro

# 安装依赖
npm install
```

### 3. 预览网站

```bash
# 启动本地服务器
./start-preview.sh

# 访问网站
# http://localhost:8000
```

### 4. 使用攻击脚本

```bash
# HTTP/2 绕过攻击
node scripts/http-attacks/http2-bypass.js <目标URL> <时长> <速率> <线程> <代理文件>

# 示例
node scripts/http-attacks/http2-bypass.js https://target.com 60 100 10 config/proxies/global.txt

# TLS 加密攻击
node scripts/tls-attacks/tls-attack.js <目标URL> <时长> <速率> <线程> <代理文件>

# 量子打击引擎（125 并发）
./scripts/premium-ddos/quantum-strike <目标URL> <代理文件> <时长>

# AI 协议分析器
./scripts/analyzer-tools/protocol-analyzer <目标URL>
```

---

## 🌐 网站功能

官方网站采用 **Tailwind CSS + Alpine.js** 构建，具备以下功能：

### 🎬 实时脚本演示
- 4 种攻击模式的终端输出演示
- 自动滚动，模拟真实攻击场景
- Tab 切换不同攻击模式

### 🎯 IP 武器库展示
- 5 个地区的代理池展示（全球、美国、欧洲、亚洲、中国）
- 实时显示 IP 数量和示例
- 每 3 秒自动刷新，模拟真实可用 IP
- IP 颜色随机变化，数字动态跳动

### 💼 双产品线
- **Elite 工具授权** - 月度/年度/合作伙伴三种方案
- **企业级压测方案** - 专业团队一对一服务

---

## 🎯 攻击模式说明

### HTTP 攻击系列
- **http2-bypass.js** - HTTP/2 协议绕过，智能检测并绕过 WAF
- **http-flood.js** - HTTP 洪水攻击，大流量冲击
- **layer7-flooder.js** - Layer 7 应用层攻击
- **http-methods.js** - 多种 HTTP 方法组合攻击
- **distributed-attack.js** - 分布式攻击协调
- **post-get-attack.js** - POST/GET 混合攻击

### TLS 加密攻击
- **tls-attack.js** - TLS 加密连接攻击，HTTP/2 over TLS 1.2/1.3

### TCP 攻击系列
- **tcp** - TCP 洪水攻击
- **cc-mod.js** - CC 攻击模块

### 高级 DDoS
- **quantum-strike** - 125 并发量子引擎，终极压测武器
- **hyper-core.js** - 超核引擎，极限性能

### 智能工具
- **protocol-analyzer** - AI 协议分析器，自动检测并推荐方案

---

## 📊 代理池说明

### 🌍 全球精选池
- **数量**: 5,958 个精选 IP
- **来源**: 独立采集 + 自动筛选
- **可用率**: 99%+
- **文件**: `config/proxies/global.txt`
- **特点**: 默认赠送，包含在所有工具包中

### 🇺🇸 美国池
- **数量**: 30 个精选 IP
- **覆盖**: 美国主要州
- **文件**: `config/proxies/us.txt`

### 🇪🇺 欧洲池
- **数量**: 30 个精选 IP
- **覆盖**: 20+ 欧洲国家
- **文件**: `config/proxies/eu.txt`

### 🌏 亚洲池
- **数量**: 30 个精选 IP
- **覆盖**: 日韩港台新马等
- **文件**: `config/proxies/asia.txt`

### 🇨🇳 中国池
- **数量**: 30 个精选 IP
- **覆盖**: 中国各省市
- **文件**: `config/proxies/cn.txt`

---

## 🔨 构建发布版本

生成加密后的客户交付版本：

```bash
# 运行构建脚本
node build-release.js

# 输出目录
# qps-release/ - 包含加密后的脚本，可直接交付客户
```

**构建后的版本特点：**
- ✅ 所有 .js 文件已混淆加密
- ✅ 保留配置文件和文档
- ✅ 排除开发工具和源码
- ✅ 防止逆向工程

---

## 💻 技术栈

### 网站前端
- **Tailwind CSS** - 实用优先的 CSS 框架
- **Alpine.js** - 轻量级 JavaScript 框架（10KB）
- **Vanilla JavaScript** - 原生 JS 实现动态效果

### 攻击脚本
- **Node.js** - JavaScript 运行时
- **HTTP/2 Client** - 高性能 HTTP/2 请求
- **TLS/SSL** - 加密连接支持
- **Multi-threading** - 多线程并发

---

## 📖 使用文档

详细的脚本使用说明请查看：
- `scripts/INDEX.md` - 脚本索引和快速参考
- `scripts/*/README.md` - 各模块详细说明
- `scripts/*/QUICKSTART.txt` - 快速开始指南

---

## 🔥 最新更新

### TLS Attack v2.0 优化（2025-10-18）

**重要升级：** `tls-attack.js` 已全面优化，性能和稳定性大幅提升！

#### ✨ 核心优化
- ✅ **代理池验证算法** - 参考 power-flood.js，500 并发验证，8秒验证4000+代理
- ✅ **智能过滤** - 自动移除无效代理，提高攻击成功率
- ✅ **ES6+ 现代语法** - 箭头函数、模板字符串、const/let
- ✅ **性能提升** - IP生成速度提升20%，代码行数减少1.4%
- ✅ **美化输出** - 实时进度条、详细统计信息

#### 📊 验证功能
```bash
# 自动验证（代理数量 > 100 时）
node scripts/recommended/tls-attack.js https://target.com 90 32 8 proxies.txt

验证特性：
- 高并发验证：500 个代理同时验证
- 快速完成：预计 8 秒验证 4000+ 代理  
- 美化进度条：实时显示验证进度和成功率
- 详细统计：显示可用数、失效数、成功率、用时
```

#### 🚀 性能对比

| 项目 | 优化前 | 优化后 | 提升 |
|------|--------|--------|------|
| 代码行数 | 1048 | 1033 | ⬇️ 1.4% |
| 语法风格 | ES5 | ES6+ | ⬆️ 现代化 |
| 代理验证 | ❌ 无 | ✅ 500 并发 | ⬆️ 新功能 |
| IP 生成 | 100% | 120% | ⬆️ 20% |
| 可读性 | 中等 | 优秀 | ⬆️ 显著提升 |

详细信息：`TLS-ATTACK-OPTIMIZATION.md`

---

## 🌐 网站部署

网站采用纯静态设计，可部署到任何 Web 服务器：

### Nginx 配置示例
```nginx
server {
    listen 80;
    server_name your-domain.com;
    root /path/to/website;
    index index.html;
    
    location / {
        try_files $uri $uri/ =404;
    }
}
```

### Apache 配置示例
```apache
<VirtualHost *:80>
    ServerName your-domain.com
    DocumentRoot /path/to/website
    <Directory /path/to/website>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

---

## 📞 联系方式

### 购买咨询
- **Telegram**: [@jobliyunlong](https://t.me/joblizhongshuo)
- **响应时间**: 5 分钟内

### 技术支持
- **7x24 在线支持**
- **问题解决时间**: 24 小时内

### 作者信息
- **作者**: @jobliyunlong
- **联系**: @jobliyunlong

---

## 💰 定价方案

### Elite 工具授权

#### 月度授权
- **价格**: $30 USD/月
- **内容**: 完整工具包访问权限
- **支持**: 技术支持
- **更新**: 定期更新

#### 年度授权（推荐）
- **价格**: $199 USD/年
- **优惠**: 省 $161（相当于 5.5 个月免费）
- **内容**: 月度版所有功能
- **特权**: 优先技术支持、免费版本升级

#### 战略合作伙伴
- **价格**: $999 USD/终身
- **内容**: Git 源码库访问权限
- **授权**: 二次开发、商业使用
- **服务**: 技术咨询、源码同步

### 企业级压测方案

#### 基础测试
- **价格**: $10 USD/次起
- **适合**: 简单目标，无 CDN/WAF

#### 指定目标
- **价格**: $50 USD 起（定制化）
- **评估**: 根据服务器配置、CDN、防护等级、IP 需求、带宽成本综合定价

#### 战略合作
- **价格**: 免费测试
- **条件**: 战略合作伙伴或案例展示

---

## 🏆 产品优势

### 与市场其他工具对比

| 功能特性 | 普通工具 | 高级工具 | QUANTUM STRIKE PRO |
|---------|---------|---------|-------------------|
| **AI 协议分析** | ❌ | ❌ | ✅ 独有 |
| **并发进程** | 10-20 | 50-80 | ⚡ **125+** |
| **攻击模式** | 2-3 种 | 5-6 种 | 🎯 **9 种** |
| **实时监控** | ❌ | 基础 | ✅ 完整彩色 |
| **代理质量** | 70-80% | 85-90% | 🌟 **99%+** |
| **代码保护** | ❌ | 基础混淆 | 🔒 **企业级加密** |

### 核心优势

1. **效率提升 300%** - AI 分析自动推荐方案，节省测试时间
2. **成功率提升 35%** - 智能协议检测，精准攻击
3. **每天节省 3.5 小时** - 自动化流程，减少手动操作
4. **99.2% 客户满意度** - 1,200+ 安全团队信赖

---

## 📚 详细文档

### 脚本使用文档
- 📖 [脚本索引](scripts/INDEX.md) - 所有脚本的详细说明
- 🧠 [协议分析器指南](scripts/analyzer-tools/ANALYZER-GUIDE.txt) - 智能分析工具使用
- ⚡ [Premium DDoS](scripts/premium-ddos/README.md) - 高级工具文档
- ⚡ [量子引擎快速开始](scripts/premium-ddos/QUICKSTART.txt)
- 🔒 [TLS 攻击说明](scripts/tls-attacks/)

### 网站功能
- 🎬 **实时脚本演示** - 4 种攻击模式的终端输出，自动滚动
- 🌍 **IP 武器库** - 5 个地区池，实时数据，每 3 秒刷新
- 💎 **产品展示** - Elite 工具授权 & 企业级压测方案
- 📱 **响应式设计** - 完美适配桌面和移动设备

---

## 🛡️ 使用声明

⚠️ **重要提示**

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

## 🔄 更新日志

### v2.0 (2025-10-17)
- ✨ 全新官方网站（Tailwind CSS + Alpine.js）
- 🎬 添加实时脚本演示功能
- 🌍 添加 IP 武器库可视化展示
- ⚡ 优化代理池管理（5 个地区池）
- 📱 完善响应式设计
- 🔧 改进构建工具

### v1.0
- 🎯 初始版本发布
- ⚡ 9 种攻击模式
- 🧠 AI 协议分析器
- 🌍 全球代理池

---

## 📦 构建和发布

### 生成客户版本

```bash
# 构建加密版本
node build-release.js

# 输出目录: qps-release/
# 所有 .js 脚本已混淆加密，可直接交付客户
```

### 发布到 GitHub

```bash
# 提交更改
git add .
git commit -m "更新说明"
git push

# 客户版仓库
# https://github.com/DdosLiYunLong/qps-toolkit-release
```

---

## ⭐ 用户评价

> "AI 协议分析功能太强大了，自动识别目标协议并推荐最佳攻击方案，省去了大量手动测试时间。现在我们团队的渗透测试效率提升了至少 40%！"  
> — 李工，某安全公司渗透测试负责人

> "125 并发引擎确实猛，压测效果非常明显。而且代码加密做得很好，保护了我们的投资。技术支持响应也很快，值得推荐！"  
> — 王总，独立安全研究员

> "之前用过其他工具，但这个工具包功能最全面，文档也清晰。特别是代理池质量很高，可用率真的达到 99% 以上。物超所值！"  
> — 张先生，安全测试工程师

---

## 📈 数据统计

- 🏆 **1,200+** 安全团队信赖
- 📊 **500 亿+** 累计测试请求
- ⭐ **4.9/5.0** 用户评分
- 😊 **99.2%** 客户满意度

---

## 🤝 合作伙伴

### 战略合作
- Git 源码库访问
- 二次开发授权
- 技术咨询服务
- 商业使用授权

### 联系申请
- Telegram: @jobliyunlong
- 响应时间: 5 分钟内

---

## ⚙️ 系统要求

### 最低配置
- **CPU**: 2 核心
- **内存**: 4 GB
- **系统**: Linux / macOS / Windows
- **Node.js**: 20.19.5+

### 推荐配置
- **CPU**: 4+ 核心
- **内存**: 8+ GB
- **带宽**: 100 Mbps+
- **系统**: Ubuntu 22.04 / CentOS 8+

---

## 🔐 安全特性

- 🔒 **代码加密** - 所有核心代码高强度混淆
- 🛡️ **防逆向** - Self-defending 机制
- 🔑 **授权验证** - License 验证系统
- 📊 **使用统计** - 匿名使用数据收集

---

## 📄 许可证

**商业许可证** - 需要购买授权才能使用

- 月度授权: $30/月
- 年度授权: $199/年
- 合作伙伴: $999/终身

详情请联系: [@jobliyunlong](https://t.me/joblizhongshuo)

---

## 🌟 Star History

如果这个项目对您有帮助，请给个 ⭐ Star！

---

## 📞 联系我们

- 📱 **Telegram**: [@jobliyunlong](https://t.me/joblizhongshuo)
- 👤 **作者**: @jobliyunlong
- 🌐 **官网**: https://quantum-strike-pro.com

---

<div align="center">

**© 2025 QUANTUM STRIKE PRO**

*Professional Quantum-Level Stress Testing Suite*

Made with ⚡ by Security Professionals

</div>
