FROM debian:10.11

RUN apt-get update -y > /dev/null 2>&1 && apt-get upgrade -y > /dev/null 2>&1 && apt-get install ssh wget which ifconfig jq unzip vim curl python3 -y > /dev/null 2>&1

RUN mkdir /run/sshd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'root:root' | chpasswd
#RUN echo -e "#!/bin/bash\n\nread -p 'Masukkan username baru: ' username\nread -sp 'Masukkan password baru: ' password\necho -e \"\$username:\$password\" | chpasswd" > credentials.sh
   
COPY * .
RUN chmod 775 /*.sh

CMD ["/usr/sbin/sshd", "-D"]

CMD /entrypoint.sh

EXPOSE 22


