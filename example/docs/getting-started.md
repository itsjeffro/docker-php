# Getting started

## Setup Proxy Docker container

The example application is currently setup to use jwilders nginx proxy docker container. This will allow running multiple applications that will share port 80.

### Create the initial proxy container

First you must create the initial container. You may specify another name other than `proxy`.

```
$ docker run --name proxy -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
````

### Stopping and starting the proxy container

Stops container with the name `proxy`.

```
$ docker stop proxy
```

Starts container with the name `proxy`.

```
$ docker start proxy
```

## Setup web app Docker container

Create the `.docker.env` from the provided example.

```
$ cp .docker.env.example .docker.env
```

### Update host file

Add `127.0.0.1 local.demo.com` to your host file

### Create the container

```
$ docker-compose up -d
```

You can now view http://local.demo.com in your browser.
