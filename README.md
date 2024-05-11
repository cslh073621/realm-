抱歉给您带来了困扰。Markdown格式确实包含了一些特定的符号来定义文本的样式和结构。以下是您提供的自述文件内容，按照Markdown格式进行了调整：

```markdown
# Realm 转发一键部署脚本

本项目提供了一个一键部署脚本，用于快速设置Realm转发服务。请注意，使用本脚本需要自行承担风险，作者不对使用过程中出现的问题负责。

## 技术来源

本脚本的技术来源和参考资料可以在以下链接找到：
- [Realm 转发教程](https://zhucaidan.xyz/2022/09/570/)

## 使用前须知

- 请确保您已经充分了解脚本的功能和潜在风险。
- 使用本脚本前，请备份重要数据。
- 本脚本仅供学习和测试使用，请勿用于非法用途。

## 系统要求

- 支持的Linux发行版：Ubuntu/Debian
- 需要具备sudo权限的用户

## 安装步骤

### 1. 更新系统

在运行脚本之前，请确保您的系统是最新的。

```bash
sudo apt-get update && sudo apt-get upgrade
```

### 2. 安装必要的软件

安装cron，用于设置定时任务。

```bash
sudo apt-get install cron
```

### 3. 下载并运行脚本

您可以选择使用curl或wget下载脚本。

#### 使用curl下载

```bash
curl -o setup_realm.sh https://raw.githubusercontent.com/lgwszds/realm-/main/setup_realm.sh
```

#### 使用wget下载

```bash
wget -O setup_realm.sh https://raw.githubusercontent.com/lgwszds/realm-/main/setup_realm.sh
```

### 4. 赋予脚本执行权限

```bash
chmod +x setup_realm.sh
```

### 5. 运行脚本

```bash
./setup_realm.sh
```

### 一键指令

如果您希望一次性执行所有步骤，可以使用以下一键指令：

```bash
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install cron && curl -sSL https://raw.githubusercontent.com/lgwszds/realm-/main/setup_realm.sh -o setup_realm.sh && chmod +x setup_realm.sh && ./setup_realm.sh
```

## 注意事项

- 脚本运行过程中，请勿关闭终端。
- 脚本运行完成后，您可以通过`systemctl status realm`来检查服务状态。
- 重启realm `systemctl restart realm`
