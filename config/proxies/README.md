# 代理池说明

## 可用代理池

- **global.txt** - 全球混合代理（默认）
- **us.txt** - 美国代理（即将上线）
- **eu.txt** - 欧洲代理（即将上线）
- **asia.txt** - 亚洲代理（即将上线）
- **cn.txt** - 中国代理（即将上线）

## 格式

```
IP:PORT
例如:
192.168.1.1:8080
10.0.0.1:3128
```

## 使用

```bash
# 使用全球代理池（默认）
node scripts/http-attacks/http2-bypass.js https://target.com 60 100 10 config/proxies/global.txt

# 使用特定国家代理池
node scripts/http-attacks/http2-bypass.js https://target.com 60 100 10 config/proxies/us.txt
```
