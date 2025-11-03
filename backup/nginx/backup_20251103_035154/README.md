# Nginx配置备份

## 备份时间
2025-11-03 03:51:55

## 备份内容

### 1. 站点配置文件
- `aippt` - skyliu.tech域名的Nginx配置

### 2. 主配置文件
- `nginx.conf` - Nginx主配置文件

### 3. 已启用的站点
- `sites-enabled/` - 当前已启用的站点配置目录

## 恢复方法

如需恢复配置，请执行以下命令：

```bash
# 恢复站点配置
sudo cp /home/ubuntu/github/presentations_by_ai/backup/nginx/backup_20251103_035154/aippt /etc/nginx/sites-available/

# 恢复主配置
sudo cp /home/ubuntu/github/presentations_by_ai/backup/nginx/backup_20251103_035154/nginx.conf /etc/nginx/

# 恢复已启用的站点
sudo cp -r /home/ubuntu/github/presentations_by_ai/backup/nginx/backup_20251103_035154/sites-enabled/* /etc/nginx/sites-enabled/

# 测试配置
sudo nginx -t

# 重新加载配置
sudo systemctl reload nginx
```
