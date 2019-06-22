# Example

## Getting Started

### Run proxy container
By running a proxy container, you can run multiple web specific containers.

The example is currently setup to use jwilders nginx proxy.

```
docker run --name proxy -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
````

### Run example web application
Next, you may run the example web application after adding `127.0.0.1 local.demo.com` to your host file.

```
docker-compose up -d
```

## Docker environment file

A `.docker.env.example` is included which allows variables, such as for xdebug to be set.

```
cp .docker.env.example .docker.env
```

### Xdebug on Windows
If you're running the Docker version for Windows 10 Home edition, which requires running Docker in a VM, you may have to get the remote host ip using...

```
ipconfig
```

### Xdebug on Linux
TBA