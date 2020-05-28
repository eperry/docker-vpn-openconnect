FROM ubuntu:latest
 
RUN apt update 
RUN apt install -y openconnect
#RUN apt install -y openssh-server 
RUN apt install -y passwd python3 python3-pip dnsutils screen
RUN apt install -y mtr iputils-ping net-tools
 
COPY ./screenrc /root/.screenrc
COPY bash_logout /root/.bash_logout
COPY openconnect-config /root/openconnect-config
CMD screen -dm && sleep infinity
