FROM nginx:1.15.12-alpine



# 安装 confd
# Download the binary
RUN wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64
# 重命名二进制文件，并移动到PATH的目录下
# RUN mkdir -p /usr/local/bin/
RUN mv confd-0.16.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
# 创建配置文件目录(confdir)
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates
# 运行 confd
RUN nohup confd -interval 2 -client-key $redis_password -backend redis -node  $redis_url &
