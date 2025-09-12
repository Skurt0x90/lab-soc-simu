FROM ubuntu:22.04
LABEL maintainer="vulnerable-linux-server"
ENV DEBIAN_FRONTEND=noninteractive

# Installer des logiciels vulnérables et outils
RUN apt-get update && \
    apt-get install -y \
    netcat \
    wget \
    curl \
    python3 \
    openssh-server \
    apache2 \
    mysql-server \
    vsftpd \
    && apt-get clean

# Mot de passe root volontairement faible
RUN echo 'root:password123' | chpasswd

# Ftp faible
RUN useradd -m -s /bin/bash ftpuser && \
    echo 'ftpuser:password123' | chpasswd && \
    mkdir -p /home/ftpuser/ftp/upload && \
    chown -R ftpuser:ftpuser /home/ftpuser/ftp && \
    chmod -R 777 /home/ftpuser/ftp/upload

# Autorisation de l'écriture avec l'utilisateur
RUN echo "listen=YES" >> /etc/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd.conf && \
    echo "chroot_local_user=YES" >> /etc/vsftpd.conf && \
    echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf && \
    echo "user_sub_token=\$USER" >> /etc/vsftpd.conf && \
    echo "local_root=/home/\$USER/ftp" >> /etc/vsftpd.conf && \
    echo "listen_ipv6=NO" >> /etc/vsftpd.conf && \
    echo "pasv_enable=YES" >> /etc/vsftpd.conf && \
    echo "pasv_min_port=30000" >> /etc/vsftpd.conf && \
    echo "pasv_max_port=30009" >> /etc/vsftpd.conf
    
# Connexion SSH avec root
RUN mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Configurer Apache avec un fichier vulnérable (ex: LFI)
RUN echo "<?php include($_GET['page']); ?>" > /var/www/html/index.php

# Copier le script d'entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exposer les ports vulnérables
EXPOSE 21 22 80 3306

# Utiliser le script d'entrée
ENTRYPOINT ["/entrypoint.sh"]