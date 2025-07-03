#!/bin/bash

# 设置错误时退出
set -e

# 加载 nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 设置代理
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export HTTPS_PROXY=http://127.0.0.1:7890
export HTTP_PROXY=http://127.0.0.1:7890
export all_proxy=http://127.0.0.1:7890
export ALL_PROXY=http://127.0.0.1:7890

# 禁用一些可能导致问题的功能
export GEMINI_DISABLE_TELEMETRY=1  # 禁用遥测
export GEMINI_DISABLE_UPDATE_CHECK=1  # 禁用更新检查
export GEMINI_DISABLE_ANALYTICS=1  # 禁用分析
export NODE_OPTIONS="--no-warnings --enable-source-maps"  # Node.js 选项

# 设置认证和沙箱配置
export GEMINI_AUTH_TYPE=api-key  # 使用 API Key 认证
export GEMINI_INTERACTIVE=true  # 强制启用交互模式
export FORCE_COLOR=1  # 强制启用颜色输出

# 沙箱配置
export SANDBOX=sandbox-exec  # 使用 macOS Seatbelt
export GEMINI_SANDBOX=true  # 启用 Gemini 沙箱
export SEATBELT_PROFILE=permissive-open  # 使用更宽松的配置
export DEBUG=1  # 启用调试模式

# 设置必要的环境变量
export npm_package_version="0.1.9"
export SANDBOX_IMAGE_REGISTRY="us-docker.pkg.dev/gemini-code-dev/gemini-cli"
export SANDBOX_IMAGE_NAME="sandbox"

# 清理 CI 相关变量
unset CI
unset CI_

# 检查是否需要重新构建
if [ "$1" == "--rebuild" ]; then
    npm install
    npm run build
fi

# 启动应用
npm start 