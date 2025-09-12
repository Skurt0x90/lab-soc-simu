#!/bin/bash
service ssh start
service apache2 start
service vsftpd start
service mysql start
# Attendre que MySQL soit prêt
sleep 5
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';"

# Étape 2 : recréer root@'%' avec mdp
mysql -uroot -p123456 -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';"
mysql -uroot -p123456 -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
mysql -uroot -p123456 -e "FLUSH PRIVILEGES;"

# Étape 3 : créer une DB de test
mysql -uroot -p123456 -e "CREATE DATABASE IF NOT EXISTS test;"
# Garder le conteneur en vie
bash