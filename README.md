
I created this repo because there are times, I just want a CLI interface into my company so I can ssh to a couple servers and want to avoid connecting my entire PC to the company network

So, I have create a config for "OpenConnect" which is compatible with "Cisco Anyconnect" which will allow my Docker container to connect to my Company's vpn and give me a shell prompt where I can ssh to any host in my company.
# Build

## Requirements
docker install 
  I use windows 10 - https://docs.docker.com/docker-for-windows/install/
  and I also use Windows 10 Linx subsystem "WSL2"  https://docs.microsoft.com/en-us/windows/wsl/install-win10


## Pull the lates version of the image

```
docker pull docker.pkg.github.com/eperry/docker-vpn-openconnect/openconnect:latest
```

## OR Build the container (Reccomended)

copy the default config file ( Minimum of what I us, your config maybe different )

```
cp openconnect-config.example openconnect-config
```

Build the container

```
docker build --rm=true -t eperry:openconnect .
```

# RUN The container and capture the Container id

```
export CID=`docker run -d --rm --privileged -e VPNSERVER='https://YOURSERVER" eperry:openconnect`
```

## Attached to the Docker container, on the "OpenConnect" screen

```
docker exec -it $CID screen -r -p 'OpenConnect'
```

Now you can, CTL-a 1  to swtich to a pre-setup bash prompt or use ***screen*** to create more windows

## Kill the container

The container should terminiate on logout but if you want to be sure

```
docker kill $CID
```

## enhance your config file

```
user=<yourid>
authgroup="General Access" 
quiet
no-dtls
```


# Something cool

## deploy and connect the vpn


```
export CID=`docker run -d --rm --privileged -e VPNSERVER='https://connect.saksinc.com' -p 8888:8888 --name openconnect eperry:openconnect
```
***NOTE*** notice the "-p 8888:8888" this is for the next step proxy server

## Spawn a proxy server

Now we are going to share the network namespace when we spawn up another docker container.

```
docker run -d --name='tinyproxy' --network=container:openconnect --rm dannydirect/tinyproxy:latest ANY
```

# Set your proxy.

Now configure your proxy server in your brower to localhost:8888 or run it via the cli

```
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --proxy-server="172.30.221.55:8888"
```

Now you can use your brower over the VPN thought the proxy server
