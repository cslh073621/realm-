#!/bin/bash

# 下载 realm 可执行文件
wget -O realm.tar.gz "https://github.com/zhboner/realm/releases/download/v2.5.4/realm-x86_64-unknown-linux-gnu.tar.gz"

# 检查下载是否成功
if [ $? -ne 0 ]; then
    echo "下载 realm 可执行文件失败。请检查网络连接或下载链接是否正确。"
    exit 1
fi

# 解压文件
tar -xzf realm.tar.gz

# 移动 realm 可执行文件到 /root 目录
mv realm /root/

# 赋予 realm 可执行权限
chmod +x /root/realm

# 创建 realm 配置文件
cat <<EOF > /root/realm.toml
[network]
no_tcp = false
use_udp = true

[[endpoints]]
listen = "0.0.0.0:23456"
remote = "test.cloudflare.com:23456"

[[endpoints]]
listen = "0.0.0.0:54321"
remote = "1.1.1.1:443"
EOF

# 创建自启动服务项
cat <<EOF > /etc/systemd/system/realm.service
[Unit]
Description=realm
After=network-online.target
Wants=network-online.target systemd-networkd-wait-online.service

[Service]
Type=simple
User=root
Restart=on-failure
RestartSec=5s
DynamicUser=true
ExecStart=/root/realm -c /root/realm.toml

[Install]
WantedBy=multi-user.target
EOF

# 开启服务配置自启
systemctl daemon-reload
systemctl enable realm
systemctl start realm

# 设置定时重启 realm 服务
(crontab -l 2>/dev/null; echo "00 01 * * * systemctl restart realm"; echo "00 05 * * * systemctl restart realm"; echo "00 09 * * * systemctl restart realm"; echo "00 13 * * * systemctl restart realm"; echo "00 17 * * * systemctl restart realm"; echo "00 21 * * * systemctl restart realm") | crontab -

echo "脚本执行完毕。"
