FROM ubuntu:14.0

LABEL maintainer="pentest_server_lab"

ENV DEBIAN_FRONTEND=noninteractive

#  Vuln software
RUN apt-get update && \
    apt-get install -y \
    netcat \
    wget \
    curl \
    python \
    openssh-server \
    apache2 \
    mysql-server \
    vsftpd && \
    apt-get clean

# Easy root password
RUN echo 'root:123456' | chpasswd

# Configurer vsftpd pour FTP anonyme et écriture
RUN echo "listen=YES" >> /etc/vsftpd.conf && \
    echo "anonymous_enable=YES" >> /etc/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd.conf

# Conf SSH (root access)
RUN mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config

# Expose PORT
EXPOSE 21 22 80 3306

# Launch service
CMD service ssh start && service apache2 start && service mysql start && service vsftpd start && bash
