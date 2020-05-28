# docker-vpn-openconnect
Connect to a VPN server with Openconnect within a docker container.

# Build the container
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

Now you can, CTL-A 1  to swtich to a bash prompt

# Kill the container

The container should terminiate on logout but if you want to be sure

```
docker kill $CID
```
