# Using Xdebug

## Getting started

Xdebug is currently setup to not start automatically. Instead you can activate the debugger by using bookmarks or a browser extension.

[JetBrains Xdebug bookmarks](https://www.jetbrains.com/phpstorm/marklets/)


## Docker ENV

Prior to actually debugging your code you may need to set some of the values in your `.docker.ev` file.

### Windows

If you're running the Docker version for Windows 10 Home edition which requires running Docker in a VM you may have to get the remote host ip using `ipconfig`.

Once you have your IP address you may add it to `XDEBUG_REMOTE_HOST` in the `.docker.env` file.

```bash
$ ipconfig
```

Output:

```bash
Ethernet adapter Ethernet:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :

Ethernet adapter VirtualBox Host-Only Network:

   Connection-specific DNS Suffix  . :
   IPv4 Address. . . . . . . . . . . : <your-ipv4-address>
```

### Linux

TBA


## Editor/IDE setup

### Via Visual Studio Code

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