# VulnNet 
This is a CTF challenge. We have an old vulnerable version of telnet that has a vulnerability in it. Your task is to get the `/flag` from our server, which is owned by root.

You have a login into our telnet server: `ctfuser`/`ctfpassword`.

You can reach the server on `localhost 2323`. 

## Files
- `README.md`: this file!
- `Dockerfile`: the dockerfile of our vulnerable server, showing building and deployment.
- `inetutils-2.7.tar.gz`: all of the source code relevant to the challenge. Note: only things in `src` are really relevant.

## Scope 
All source files in `inetutils-2.7/src` are relevant. The server is running exactly this version.
