#!/bin/bash

# 获取当前分支名称
branch_name=$(git branch --show-current)

# 将本地更改添加到暂存区
git add .

# 提交本地更改
git commit -m "Update code"

# 推送本地更改到远程仓库
git push origin $branch_name