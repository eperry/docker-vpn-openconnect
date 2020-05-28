
I created this repo because there are times, I just want a CLI interface into my company so I can ssh to a couple servers and want to avoid connecting my entire PC to the company network

So, I have create a config for "OpenConnect" which is compatible with "Cisco Anyconnect" which will allow my Docker container to connect to my Company's vpn and give me a shell prompt where I can ssh to any host in my company.

# Pull the lates version of the image

docker pull docker.pkg.github.com/eperry/docker-vpn-openconnect/openconnect:latest

# OR Build the container (Reccomended)

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

# Attached to the Docker container, on the "OpenConnect" screen

```
docker exec -it $CID screen -r -p 'OpenConnect'
```

Now you can, CTL-a 1  to swtich to a pre-setup bash prompt or use ***screen*** to create more windows

# Kill the container

The container should terminiate on logout but if you want to be sure

```
docker kill $CID
```

# enhance your config file

```
user=<yourid>
authgroup="General Access" 
quiet
no-dtls
```
