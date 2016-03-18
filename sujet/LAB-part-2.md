# LAB-part-2

## Goal

Following up on LAB-part-1, let's add redundancy to ownCloud.

## Containers

We will build the following containers based on the **ubuntu:trusty** image
- 1 x www2 (apache/php/ownCloud)
- 1 x lb (haproxy)

### www2 (apache)

Already done in LAB-part-1.

### lb (haproxy)

- the package is named: **haproxy**
- the daemon is: **/usr/sbin/haproxy**

**Tips**

Sample configuration file (*/etc/haproxy/haproxy.cfg*)  
(**www1** and **www2** are the name of your ownCloud backend containers)

    global
        maxconn 256

    defaults
        mode http
        timeout connect 5000ms
        timeout client 50000ms
        timeout server 50000ms

    frontend http
        bind *:80
        default_backend servers
        option http-server-close

    backend servers
        balance roundrobin
        mode http
        cookie SERVERID insert indirect nocache
        server server1 www1:80 check cookie server1
        server server2 www2:80 check cookie server2

## Wrapping things up

- stop and destroy the **www1** (apache) container
- create a Docker network called **front** (which **lb**, **www1** and **www2** will be part of)
- attach the **wwwdata** volume to both the **www1** and **www2** containers (apache)
- attach the **front** network to both **www1** and **www2**
- bind host port 80 to **lb** instead of **www1**

e.g. containers can be (re)started as follow (adapt to your preferences)  

    docker stop WWW1_CONTAINER_ID
    docker rm WWW1_CONTAINER_ID

    docker network create front

    docker run -d --name=www1 --net data -v wwwdata:/var/www/html/owncloud/data IMAGE_ID
    docker run -d --name=www2 --net data -v wwwdata:/var/www/html/owncloud/data IMAGE_ID
    docker network connect front WWW1_CONTAINER_ID
    docker network connect front WWW2_CONTAINER_ID
    docker run -d --name=lb --net front -p 80:80 IMAGE_ID

Test the load-balancing

    $ curl 1.2.3.4/docker-test.php
    Container ID: f6e79e1e1dab<br />
    $ curl 1.2.3.4/docker-test.php
    Container ID: cd8705866825<br />

Point your web browser to http://1.2.3.4/owncloud and run the post-install steps using these values:
- Database User: **root**
- Database Password: **root** (password set in mariadb/Dockerfile)
- Database Name: **owncloud2**
- Database Host: **db** (mariadb container name)
