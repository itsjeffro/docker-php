# Docker-PHP

- PHP 8.1

## Getting Started

Build (or rebuild) the docker image.

```bash
$ docker-compose build
````

## Example application

An example application can be viewed in `/example`.

## Contributing

### Upgrading the PHP version

Update the PHP version in the following files:

- `Dockerfile`
- `/services/phpfpm.sh`
- `/environment/nginx/default`
