# Example application


## Introduction

The example application currently comes with the following services in the `docker-compose.yml` file:

* app_web - Web server
* app_db - MySQL
* app_redis - Redis

## Getting started

### 1. Proxy Docker container

The example application is currently setup to use jwilders nginx proxy docker container. This will allow running multiple applications that will share port 80.

#### Create the initial proxy container

First you must create the initial container. You may specify another name other than `proxy`.

```
$ docker run --name proxy -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
````

#### Stopping and starting the proxy container

Stops container with the name `proxy`.

```
$ docker stop proxy
```

Starts container with the name `proxy`.

```
$ docker start proxy
```

### 2. Setting up Xdebug

Create the `.docker.env` from the provided example.

```
$ cp .docker.env.example .docker.env
```

#### Windows

If you're running the Docker version for Windows 10 Home edition which requires running Docker in a VM you may have to get the remote host ip using `ipconfig`.

Once you have your ip address you may add it to `XDEBUG_REMOTE_HOST` in the `.docker.env` file.

```
$ ipconfig
```
```
## Output

Ethernet adapter Ethernet:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :

Ethernet adapter VirtualBox Host-Only Network:

   Connection-specific DNS Suffix  . :
   IPv4 Address. . . . . . . . . . . : <your-ipv4-address>
```

#### Linux

TBA

### 3. Web app Docker container

#### Update host file

Add `127.0.0.1 local.demo.com` to your host file

#### Create the container

```
$ docker-compose up -d
```

You can now view http://local.demo.com in your browser.

## Mysql

### Connecting

#### Via terminal

```
$ docker exec -it app_db bash
```

```
$ mysql -uroot -p
```

#### Via MySQL client

Use `docker-machine ip` to retrieve your IP address.

```
$ docker-machine ip
```
```
# Example output

192.168.99.100
```

Use `docker ps` to retrieve the port. In the example below, we would use `32790`.

```
$ docker ps
```
```
# Example output

7c46cbe913fa   mysql:5.7   "docker-entrypoint.s…"   7 minutes ago   Up 7 minutes   33060/tcp, 0.0.0.0:32790->3306/tcp   app_db
```

## Xdebug

### VSCode

```json
{
    "version": "0.2.0",
    "configurations": [
    
        {
            "name": "Listen for XDebug",
            "type": "php",
            "request": "launch",
            "port": 9000,
            "pathMappings": {
                "/var/www/html": "${workspaceRoot}/example",
                "/var/www/html/public": "${workspaceRoot}/example/public"
            }
        }
    ]
}
```