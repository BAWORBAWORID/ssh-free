FROM debian:10.11

RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'root:root' >> /etc/ssh/chpasswd

COPY * .
RUN chmod 775 /*.sh

CMD ["/usr/sbin/sshd", "-D"]

CMD /entrypoint.sh

EXPOSE 22


