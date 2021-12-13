sudo docker network create -d macvlan \
  --subnet=192.168.0.0/24 \
  --gateway=192.168.0.1 \
  --ip-range=192.168.0.200/29 \
  --aux-address 'host=192.168.0.104' \
  -o parent=eno1 vlan

sudo ip link add macvlan link eno1 type macvlan mode bridge
sudo ip addr add 192.168.0.104/24 dev macvlan
sudo ip link set macvlan up
sudo ip route add 192.168.0.200/29 dev macvlan

