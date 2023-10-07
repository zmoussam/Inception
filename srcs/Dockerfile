# base image
FROM    debian:buster

# install wget
RUN apt update && apt install -y wget

# download the cadvisor with wget
RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64

# change the name of cadvisor executable
RUN mv cadvisor-v0.47.0-linux-amd64 cadvisor

# change the permission for cadvisor
RUN chmod +x cadvisor

# running ther cadvisor programm
CMD [ "./cadvisor" ]