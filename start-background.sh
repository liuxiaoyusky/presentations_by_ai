#!/bin/bash

# 加载nvm并使用Node.js 20.19.0
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 20.19.0

# 进入vue_ppt目录
cd "$(dirname "$0")/vue_ppt"

# 检查是否有vite进程在运行
VITE_PID=$(ps aux | grep "vite" | grep -v grep | awk '{print $2}')

if [ -n "$VITE_PID" ]; then
    echo "发现正在运行的Vite进程 (PID: $VITE_PID)，正在终止..."
    kill $VITE_PID
    sleep 2
fi

# 启动开发服务器（后台运行）
echo "使用Node.js $(node --version) 启动Vue项目..."
echo "项目将在 http://localhost:5175/ 上运行"
echo "服务器已在后台启动，日志保存在 /tmp/vite.log"
echo "使用 'tail -f /tmp/vite.log' 查看实时日志"
echo "使用 './stop.sh' 停止服务器"
echo "----------------------------------------"

nohup npm run dev > /tmp/vite.log 2>&1 &

# 等待服务器启动
sleep 3

# 检查服务器是否成功启动
if curl -s http://localhost:5175 > /dev/null; then
    echo "✅ 服务器启动成功！"
else
    echo "❌ 服务器启动失败，请检查日志：cat /tmp/vite.log"
fi
