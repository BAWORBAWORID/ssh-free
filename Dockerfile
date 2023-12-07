FROM debian:10.11

# Install OpenSSH server
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22


CMD ["/usr/sbin/sshd", "-D"]
CMD /entrypoint.sh
