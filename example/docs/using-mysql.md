# Mysql

## Connection options

### Via terminal

```bash
$ docker exec -it app_db bash
```

```bash
$ mysql -uroot -p
```

### Via MySQL client

Use `docker-machine ip` to retrieve your IP address.

```bash
$ docker-machine ip
```

Example output:

```bash
192.168.99.100
```

Use `docker ps` to retrieve the port. In the example below, we would use `32790`.

```bash
$ docker ps
```

Example output:

```bash
7c46cbe913fa   mysql:5.7   "docker-entrypoint.s…"   7 minutes ago   Up 7 minutes   33060/tcp, 0.0.0.0:32790->3306/tcp   app_db
```
