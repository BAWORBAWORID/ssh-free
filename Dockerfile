FROM debian:10.11

# Install OpenSSH server
RUN apt-get update -y > /dev/null 2>&1 && apt-get install openssh-server -y > /dev/null 2>&1
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd

# Membuat user dengan username dan password yang diinginkan
#RUN useradd -m -d /home/root -s /bin/bash root
#RUN echo 'root;root' | chpasswd
#RUN echo 'root ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
EXPOSE 22

RUN chmod 777 *.sh
COPY * .

CMD ["/usr/sbin/sshd", "-D"]
RUN service ssh start

CMD /entrypoint.sh
