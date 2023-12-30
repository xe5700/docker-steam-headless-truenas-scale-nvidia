FROM josh5/steam-headless:debian
ARG DEBIAN_FRONTEND=noninteractive
# syntax=docker/dockerfile:1.3-labs
RUN cat <<EOF > /etc/apt/source.list
deb https://mirrors.aliyun.com/debian/ sid main non-free contrib
EOF
RUN <<EOF
sed -i 's/bookworm/sid/g' /etc/apt/sources.list.d/*
sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/*
apt-get update
apt-get install -y gamescope aria2
apt-get -y dist-upgrade
EOF
ADD overlay/ /
#RUN rm /etc/supervisor.d/xorg.ini