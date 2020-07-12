## Running Containers in a macvlan on Synology NAS

This repository contains configuration for running homeassistant, nginx proxy manager, and pihole on a Synology NAS.

The resulting configuration will resemble the diagram below. Customize the IP addresses in [start.sh](./start.sh) and the relevant `docker-compose.yml` files to change which IP addresses the containers will use.

![](./docs/nginx-macvlan.svg?raw=true)

