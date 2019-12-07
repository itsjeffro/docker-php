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

If you're running the Docker version for Windows 10 Home edition which requires running Docker in a VM, you may have to get the remote host ip using...

```
$ ipconfig
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