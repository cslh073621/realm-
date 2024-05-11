# realm转发一键生成
gpt生成个人使用,出现问题概不负责
技术来源:https://zhucaidan.xyz/2022/09/570/
使用方式
更新系统
sudo apt-get update && sudo apt-get install cron

# 使用 curl 下载脚本
curl -o setup_realm.sh https://raw.githubusercontent.com/lgwszds/realm-/main/setup_realm.sh

# 赋予脚本执行权限
chmod +x setup_realm.sh

# 运行脚本
./setup_realm.sh

或
# 使用 wget 下载脚本
wget -O setup_realm.sh https://raw.githubusercontent.com/lgwszds/realm-/main/setup_realm.sh

# 赋予脚本执行权限
chmod +x setup_realm.sh

# 运行脚本
./setup_realm.sh

# 一键指令
sudo apt-get update && sudo apt-get install cron && curl -sSL https://raw.githubusercontent.com/lgwszds/realm-/main/setup_realm.sh -o setup_realm.sh && chmod +x setup_realm.sh && ./setup_realm.sh
