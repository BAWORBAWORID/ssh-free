# Use Debian 10.11 as the base image
FROM debian:10.11

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/lists/*

# Create an SSH user
ARG SSH_USER=fazza
ARG SSH_PASSWORD=12345678
RUN useradd -m -s /bin/bash ${SSH_USER} && \
    echo "${SSH_USER}:${SSH_PASSWORD}" | chpasswd

# Expose SSH port
EXPOSE 22

# Copy SSH configuration files
COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /entrypoint.sh

# Set permissions for entrypoint script
RUN chmod +x /entrypoint.sh

# Start SSH server using the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
