#!/bin/bash

echo "开始构建Hugo站点..."

# 清理旧的构建文件
rm -rf public

# 以生产模式构建Hugo站点
hugo --minify

# 将public目录的内容复制到根目录
echo "复制静态文件到根目录..."
cp -r public/* .

# 添加到Git
echo "提交更改到Git..."
git add .
git commit -m "自动部署: $(date '+%Y-%m-%d %H:%M:%S')"

# 推送到GitHub
echo "推送到GitHub..."
git push origin main

echo "部署完成！请等待几分钟后访问 https://ivonlee.github.io" 