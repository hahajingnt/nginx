FROM nginx:1.15.12-alpine 

# 安装 confd
function Getconfd(){
    # Download the binary
    echo "wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64"
    # 重命名二进制文件，并移动到PATH的目录下
    mv confd-0.16.0-linux-amd64 /usr/local/bin/confd
    chmod +x /usr/local/bin/confd
    #创建配置文件目录(confdir)
    mkdir -p /etc/confd/conf.d
    mkdir -p /etc/confd/templates
}

#main
Getconfd

