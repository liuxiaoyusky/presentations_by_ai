#!/bin/bash

# Nginx配置备份脚本

BACKUP_DIR="/home/ubuntu/github/presentations_by_ai/backup/nginx"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
CURRENT_BACKUP_DIR="$BACKUP_DIR/backup_$TIMESTAMP"

# 创建备份目录
mkdir -p "$CURRENT_BACKUP_DIR"

echo "开始备份Nginx配置到 $CURRENT_BACKUP_DIR"

# 备份站点配置
echo "备份站点配置..."
sudo cp /etc/nginx/sites-available/aippt "$CURRENT_BACKUP_DIR/"

# 备份主配置
echo "备份主配置..."
sudo cp /etc/nginx/nginx.conf "$CURRENT_BACKUP_DIR/"

# 备份已启用的站点
echo "备份已启用的站点..."
sudo cp -r /etc/nginx/sites-enabled "$CURRENT_BACKUP_DIR/"

# 创建备份信息文件
cat > "$CURRENT_BACKUP_DIR/README.md" << EOF
# Nginx配置备份

## 备份时间
$(date +"%Y-%m-%d %H:%M:%S")

## 备份内容

### 1. 站点配置文件
- \`aippt\` - skyliu.tech域名的Nginx配置

### 2. 主配置文件
- \`nginx.conf\` - Nginx主配置文件

### 3. 已启用的站点
- \`sites-enabled/\` - 当前已启用的站点配置目录

## 恢复方法

如需恢复配置，请执行以下命令：

\`\`\`bash
# 恢复站点配置
sudo cp $CURRENT_BACKUP_DIR/aippt /etc/nginx/sites-available/

# 恢复主配置
sudo cp $CURRENT_BACKUP_DIR/nginx.conf /etc/nginx/

# 恢复已启用的站点
sudo cp -r $CURRENT_BACKUP_DIR/sites-enabled/* /etc/nginx/sites-enabled/

# 测试配置
sudo nginx -t

# 重新加载配置
sudo systemctl reload nginx
\`\`\`
EOF

echo "备份完成！"
echo "备份位置: $CURRENT_BACKUP_DIR"

# 列出所有备份
echo ""
echo "所有备份:"
ls -la "$BACKUP_DIR" | grep backup_
