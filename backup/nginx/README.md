# Nginx配置备份

## 备份时间
2025-11-03

## 备份内容

### 1. 站点配置文件
- `aippt` - skyliu.tech域名的Nginx配置

### 2. 主配置文件
- `nginx.conf` - Nginx主配置文件

### 3. 已启用的站点
- `sites-enabled/` - 当前已启用的站点配置目录

## 配置说明

### skyliu.tech域名配置
- 监听80端口
- 将/aippt和/aippt/路径重定向到根路径
- 其他请求代理到localhost:5175(Vue开发服务器)
- 支持WebSocket连接

## 恢复方法

如需恢复配置，请执行以下命令：

```bash
# 恢复站点配置
sudo cp /path/to/backup/nginx/aippt /etc/nginx/sites-available/

# 恢复主配置
sudo cp /path/to/backup/nginx/nginx.conf /etc/nginx/

# 恢复已启用的站点
sudo cp -r /path/to/backup/nginx/sites-enabled/* /etc/nginx/sites-enabled/

# 测试配置
sudo nginx -t

# 重新加载配置
sudo systemctl reload nginx
```
