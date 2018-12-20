# 快速启动ss
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
docker run -dt --name ssserver --restart=always -p 443:6443 mritd/shadowsocks -m "ss-server" -s "-s 0.0.0.0 -p 6443 -m chacha20-ietf-poly1305 -k “qmhtssr” --fast-open --plugin obfs-server --plugin-opts "obfs=http""

cat >> /etc/sysctl.conf << EOF
 net.core.default_qdisc=fq
 net.ipv4.tcp_congestion_control=bbr
EOF
