FROM debian:latest

# install bluez related packages
RUN apt-get update && apt-get install -y \
    bluez \
    dbus \
    sudo
 


# setup bluetooth permissions
COPY ./bluezuser.conf /etc/dbus-1/system.d/
RUN useradd -m bluezuser \
 && adduser bluezuser sudo \
 && passwd -d bluezuser
USER bluezuser

# setup startup script
COPY entrypoint.sh .
CMD ./entrypoint.sh
