# 仓库管理指南

## 📚 两个仓库说明

### 1. quantum-strike-pro（源码仓库 - 私有）

**地址：** `git@github.com:DdosLiYunLong/quantum-strike-pro.git`

**用途：** 开发和维护

**包含内容：**
- ✅ 完整源码（未加密）
- ✅ 授权系统（auth-system/）
- ✅ 构建脚本（build-release.js）
- ✅ 测试文件（test/）
- ✅ 网站源码（website/）

**注意：** 必须保持私有！包含敏感信息。

---

### 2. qps-toolkit-release（发布仓库 - 公开）

**地址：** `git@github.com:DdosLiYunLong/qps-toolkit-release.git`

**用途：** 客户下载使用

**包含内容：**
- ✅ 加密脚本（所有 .js 已混淆）
- ✅ 配置文件
- ✅ 使用文档
- ⛔ 不含源码
- ⛔ 不含授权系统

**注意：** 可以公开，客户可以自由下载。

---

## 🔄 日常开发流程

### 步骤1：开发新功能

```bash
cd /Users/caoziyang/Desktop/work/qps

# 修改源码
vim scripts/http-attacks/new-feature.js

# 提交到源码仓库
git add -A
git commit -m "feat: 添加新功能"
git push origin main
```

---

### 步骤2：构建加密版本

```bash
# 在项目根目录执行
node build-release.js
```

**输出：** `qps-release/` 目录（包含加密后的脚本）

---

### 步骤3：发布到客户仓库

```bash
cd qps-release

# 查看变更
git status

# 提交变更
git add -A
git commit -m "release: v1.x.x 版本更新
- 新增功能 A
- 修复问题 B
- 优化性能 C"

# 推送到公开仓库
git push origin main --force
```

---

## 🛠️ 快速命令

### 完整发布流程（一键）

```bash
#!/bin/bash
# release.sh - 快速发布脚本

cd /Users/caoziyang/Desktop/work/qps

# 1. 提交源码
git add -A
git commit -m "feat: 更新"
git push origin main

# 2. 构建
node build-release.js

# 3. 发布
cd qps-release
git add -A
git commit -m "release: 版本更新"
git push origin main --force

echo "✅ 发布完成！"
```

**使用：**
```bash
chmod +x release.sh
./release.sh
```

---

## 📋 检查清单

### 发布前检查

- [ ] 源码已测试通过
- [ ] 已更新版本号（package.json）
- [ ] 已更新 RELEASE_NOTE.md
- [ ] 已运行 `node build-release.js`
- [ ] 确认 qps-release/ 不包含敏感信息
- [ ] 确认 quantum-strike-pro 仍然是私有

### 发布后验证

- [ ] 访问 https://github.com/DdosLiYunLong/qps-toolkit-release
- [ ] 检查最新提交是否显示
- [ ] 下载测试：`git clone https://github.com/DdosLiYunLong/qps-toolkit-release.git /tmp/test`
- [ ] 运行测试：`cd /tmp/test && npm install && node scripts/recommended/http2-bypass.js --help`

---

## 🔐 安全注意事项

### 绝对不能提交到公开仓库的内容

1. **auth-system/** - 授权系统
   - 包含管理员密码
   - 包含授权逻辑
   - 包含数据库结构

2. **源码文件** - 未加密的 .js
   - scripts/ 中的原始代码
   - 暴露攻击算法

3. **测试文件** - test/
   - 可能包含敏感测试数据

4. **构建脚本** - build-release.js
   - 暴露加密方法

### 已加密可以公开的内容

- ✅ qps-release/ 中的所有文件
- ✅ config/ 配置文件
- ✅ 使用文档（README.md 等）

---

## 🚨 紧急处理

### 如果意外推送了敏感信息到公开仓库

```bash
# 1. 立即强制推送干净版本覆盖
cd qps-release
git push origin main --force

# 2. 在 GitHub 上删除敏感 commit 的历史
# Settings → Danger Zone → Delete this repository（如果必要）
# 然后重新创建仓库

# 3. 修改所有暴露的密码
cd ../auth-system/server/database
# 修改 licenses.json 中的密码哈希
```

---

## 📊 仓库状态监控

### 定期检查

```bash
# 检查公开仓库内容
git clone https://github.com/DdosLiYunLong/qps-toolkit-release.git /tmp/check
cd /tmp/check

# 确认不包含敏感内容
ls -la | grep -E "auth-system|test"  # 应该为空

# 确认脚本已加密
head -20 scripts/http-attacks/http2-bypass.js  # 应该看到混淆代码

# 清理
rm -rf /tmp/check
```

---

## 📞 常见问题

### Q: 如何添加新脚本？

1. 在源码仓库 `scripts/` 中开发
2. 运行 `node build-release.js` 自动加密
3. 推送到公开仓库

---

### Q: 如何更新授权系统？

1. 只在源码仓库 `auth-system/` 中修改
2. **不要**推送到公开仓库
3. 单独部署到授权服务器

---

### Q: 客户反馈问题如何调试？

1. 在源码仓库调试（未加密代码）
2. 修复后重新构建
3. 发布更新版本

---

### Q: 如何回滚版本？

```bash
# 在 qps-release 仓库
git log --oneline  # 查看历史
git reset --hard <commit-id>  # 回滚到指定版本
git push origin main --force  # 强制推送
```

---

## 🎯 最佳实践

1. **频繁提交源码** - 保持源码仓库更新
2. **定期发布** - 每周或每月发布稳定版本
3. **版本标签** - 使用 git tag 标记重要版本
4. **更新日志** - 维护详细的 RELEASE_NOTE.md
5. **安全审查** - 发布前检查不包含敏感信息

---

## 🔗 相关链接

- **源码仓库（私有）：** https://github.com/DdosLiYunLong/quantum-strike-pro
- **发布仓库（公开）：** https://github.com/DdosLiYunLong/qps-toolkit-release
- **授权管理：** https://auth.baidunow.icu/admin

---

**最后更新：** 2025-10-19

