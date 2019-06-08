# Example

## Getting Started

### Run proxy container
By running a proxy container, you can run multiple web specific containers.

The example is currently setup to use jwilders nginx proxy.

```
docker run --name proxy -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
````

### Run example web application
Next, you may run the example web application.

```
docker-compose up -d
```
