# kcp-docker
# How to use
command=/opt/kcptun/client_linux_amd64 -l :29900 -t 127.0.0.1:8989 -crypt "salsa20" --mtu 1350 --sndwnd 1024 --rcvwnd 1024 --mode "fast2"

