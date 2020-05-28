# docker-vpn-openconnect
Connect to a VPN server with Openconnect within a docker container.

# Build the container
docker build --rm=true -t eperry:openconnect .

# RUN The container and capture the Container id

export CID=`docker run -d --rm --privileged eperry:openconnect`

#

docker exec -it $CID screen -r -p 'OpenConnect'

#

docker kill $DPID
