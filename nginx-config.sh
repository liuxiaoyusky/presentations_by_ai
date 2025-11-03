#!/bin/bash

# Nginx配置管理脚本

case "$1" in
    "test")
        echo "测试Nginx配置..."
        sudo nginx -t
        ;;
    "reload")
        echo "重新加载Nginx配置..."
        sudo nginx -t && sudo systemctl reload nginx
        ;;
    "status")
        echo "Nginx服务状态:"
        sudo systemctl status nginx --no-pager
        ;;
    "logs")
        echo "Nginx访问日志 (最后20行):"
        sudo tail -20 /var/log/nginx/access.log
        echo ""
        echo "Nginx错误日志 (最后20行):"
        sudo tail -20 /var/log/nginx/error.log
        ;;
    "show-config")
        echo "当前skyliu.tech站点配置:"
        sudo cat /etc/nginx/sites-available/aippt
        ;;
    *)
        echo "用法: $0 {test|reload|status|logs|show-config}"
        echo "  test       - 测试Nginx配置语法"
        echo "  reload     - 重新加载Nginx配置"
        echo "  status     - 查看Nginx服务状态"
        echo "  logs       - 查看Nginx日志"
        echo "  show-config- 显示skyliu.tech站点配置"
        exit 1
        ;;
esac
