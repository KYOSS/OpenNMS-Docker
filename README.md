# OpenNMS Docker

## Overview
    This is a linked set of containers for running OpenNMS. One container is the PostgreSQL
database server and the other is the OpenNMS server. See below for instructions on running
using an external PostgreSQL server. These containers are based on CentOS 7.

## Building Containers
```bash
git clone git@github.com:KYOSS/OpenNMS-Docker.git
cd OpenNMS-Docker
make docker
```

## Running Linked Containers

```bash
cd OpenNMS-Docker
docker-compose up -d
```

## Logging in

Open the page: http://<docker-host>:8980/opennms/

* Username: admin
* Password: admin
