## Running Containers in a macvlan on Synology NAS

Code to accompany [the blog post](https://www.travisgeis.com/2020/07/05/homeassistant-in-docker-on-synology-nas/).

This repository contains configuration for running homeassistant, nginx proxy manager, and pihole on a Synology NAS.

The resulting configuration will resemble the diagram below. Customize the IP addresses in [start.sh](./start.sh) and the relevant `docker-compose.yml` files to change which IP addresses the containers will use.

![](./docs/nginx-macvlan.svg?raw=true)

