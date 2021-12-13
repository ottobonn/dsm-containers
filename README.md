## Running Containers in a macvlan on Synology NAS

Code to accompany [the blog post](https://www.travisgeis.com/2020/07/05/homeassistant-in-docker-on-synology-nas/).

This repository contains configuration for running homeassistant, nginx proxy manager, and pihole on a Synology NAS.

The resulting configuration will resemble the diagram below. Customize the IP addresses in [start.sh](./start.sh) and the relevant `docker-compose.yml` files to change which IP addresses the containers will use.

![](./docs/nginx-macvlan.svg?raw=true)

Running these containers on a NUC required some changes. Switching home assistant to host networking mode allows it to use bluetooth.

Now that home assistant is in host networking mode, we have to give the NUC a static IP. See the network config in /etc/netplan/00-installer-config.yaml

We still run pihole and nginx-proxy-manager in macvlan to give them more ports and direct packet access.

Previously, we gave homeassistant a static IP address, which was possible because the host NAS would join the network and get its IP dynamically and it would separately bring up homeassistant in the macvlan. 

Now that homeassistant is in host networking mode, we can't rely on docker-compose to give it an IP address. Instead, we have to assign the IP to the host NUC. However, we can't do that in pihole, because it's running on the host. The static lease needs to be reserved in pihole so it won't give out that address, but in addition we have to assign it within the NUC using the netplan config mentioned above.
