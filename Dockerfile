FROM ubuntu:latest
 
RUN apt update 
RUN apt install -y openconnect ssh openssh-server ansible
RUN apt install -y passwd python3 python3-pip dnsutils screen
RUN apt install -y mtr iputils-ping net-tools
 
COPY files/* /root/
run ln -sf /root/bash_logout /root/.bash_logout
run ln -sf /root/screenrc /root/.screenrc
CMD screen -dm && sleep infinity
