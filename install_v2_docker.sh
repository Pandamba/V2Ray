#/bin/bash
rpm -q curl || yum install -y curl
rpm -q wget || yum install -y wget
suijishu=`cat /dev/urandom | tr -dc '0-9a-z' | head -c 15`
mkdir /tmp/$suijishu
cd /tmp/$suijishu
wget https://raw.githubusercontent.com/Pandamba/V2Ray/master/docker-compose.yml
read -p "请输入你的节点ID：" dockerid
#安装docker
curl -sSL https://get.docker.com | bash
service docker start
systemctl enable docker
curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/1.8.0/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
clear
#配置文件
sed -i "s|panda|$dockername|" docker-compose.yml
sed -i "s|panda|$dockerkey|" docker-compose.yml
sed -i "s|68|$dockerid|" docker-compose.yml
sed -i "s|9898|$dockerport|" docker-compose.yml
sed -i "s|https://Panda.mba|$dockerurl|" docker-compose.yml
docker-compose up -d
docker ps
echo $suijishu
