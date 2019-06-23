# Docker PHP

## Getting Started

Build the docker image.

```
docker-compose build
````

## Example application

An example application can be viewed in `/example`.

```
cd example
```

### Run a proxy container
The example application is currently setup to use jwilders nginx proxy. Which allows for running multiple applications on port 80.

Creates initial container with the name "proxy".
```
docker run --name proxy -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
````

Stops container with the name proxy.
```
docker stop proxy
```

Starts container with the name proxy.
```
docker start proxy
```

### Docker environment file

A `.docker.env.example` is included which allows variables, such as xdebug to be set. This file is currently being referenced in the `docker-compose.yml`.

You may create the environment file from the example. Otherwise, you can remove the reference in the yml file if you do not plan to use xdebug.

```
cp .docker.env.example .docker.env
```

#### Xdebug on Windows
If you're running the Docker version for Windows 10 Home edition, which requires running Docker in a VM, you may have to get the remote host ip using...

```
ipconfig
```

#### Xdebug on Linux
TBA

### Run example web application
Once you decided to either use the environment file or not, you may run the example web application after adding `127.0.0.1 local.demo.com` to your host file.

```
docker-compose up -d
```

### Browser
You can now view http://local.demo.com in your browser.