#!/bin/bash

# 查找并终止vite进程
VITE_PID=$(ps aux | grep "vite" | grep -v grep | awk '{print $2}')

if [ -n "$VITE_PID" ]; then
    echo "发现正在运行的Vite进程 (PID: $VITE_PID)，正在终止..."
    kill $VITE_PID
    sleep 2
    
    # 检查进程是否已终止
    if ps -p $VITE_PID > /dev/null; then
        echo "进程未响应，强制终止..."
        kill -9 $VITE_PID
    fi
    
    echo "✅ Vite服务器已停止"
else
    echo "没有发现正在运行的Vite服务器"
fi
