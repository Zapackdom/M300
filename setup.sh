#!/bin/bash

echo "---- Installation der PHP-Entwicklungsumgebung starten [Spezialisieren] ---"

echo "--- Paketliste aktualisieren ---"
sudo apt-get update

echo "--- User wird angelegt ---"
#lokaler user anlegen
sudo useradd admin -g  myadmin -m -s /bin/bash
sudo useradd bme -g myadmin -m -s /bin/bash
#Passwort
sudo chpasswd <<<admin:admin
sudo chpasswd <<<bme:bme

#FTP Gruppe anlegen
sudo groupadd ftpgroup
sudo useradd -g ftpgroup -d /dev/null -s /etc ftpuser
sudo pure-pw useradd lamacher -u ftpuser -g ftpgroup -d /home/pubftp/lamacher -N 10


echo "--- Festlegen eines Standardkennworts für MySQL und seine Tools ---"

DEFAULTPASS="vagrant"
sudo debconf-set-selections <<EOF
mysql-server	mysql-server/root_password password $DEFAULTPASS
mysql-server	mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common	dbconfig-common/app-password-confirm password $DEFAULTPASS
phpmyadmin		phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin		phpmyadmin/dbconfig-install boolean true
phpmyadmin      phpmyadmin/app-password-confirm password $DEFAULTPASS 
phpmyadmin      phpmyadmin/mysql/admin-pass     password $DEFAULTPASS
phpmyadmin      phpmyadmin/password-confirm     password $DEFAULTPASS
phpmyadmin      phpmyadmin/setup-password       password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/app-pass       password $DEFAULTPASS
EOF

echo "--- Basispakete installieren ---"
sudo apt-get install software-properties-common vim curl python-software-properties git-core --assume-yes --force-yes

echo "--- PHP-Paket-Repository hinzufügen ---"
sudo add-apt-repository ppa:ondrej/php

echo "--- Paketliste aktualisieren ---"
sudo apt-get update

echo "--- Installation von MySQL, Phpmyadmin und einigen anderen Modulen ---"
sudo apt-get install mysql-server-5.5 mysql-client phpmyadmin --assume-yes --force-yes

echo "--- PHP, Apache und einige Module installieren ---"
sudo apt-get install php7.1 php7.1-common --assume-yes --force-yes
sudo apt-get install php7.1-cli libapache2-mod-php7.1 php7.1-mysql php7.1-curl php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php*-mysql  php-gd php-xml php-mbstring  zip unzip --assume-yes --force-yes

echo "--- Aktivieren von PHP 7.1 ---"
sudo a2dismod php5
sudo a2enmod php7.1

echo "--- Aktivieren mod-rewrite do Apache ---"
sudo a2enmod rewrite

echo "--- Neustart Apache ---"
sudo service apache2 restart

echo "--- Composer herunterladen und installieren ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- NoSQL Bank installieren -> Redis <- ---" 
sudo apt-get install redis-server --assume-yes
sudo apt-get install php7.1-redis --assume-yes

# Ab hier an falls man noch Zusatz braucht
#Sicherheitsaspekt

echo "--- Firewall wird eingerichtet ---"
sudo apt-get install ufw
#Firewall installieren

sudo ufw enable -Y
#Firewall aktivieren

echo "--- Firewall Regeln werden implementiert ---"

#Port 80 öffnen
sudo ufw allow 80/tcp

#Port 8080 öffnen
sudo ufw allow 8080

#Port 8000 öffnen
sudo ufw allow 8000

#Port 22 für den lokalen Computer öffnen IP muss angepasst werden beim Netzwerk wechsel.
sudo ufw allow from [192.168.0.12] to any Port 22

echo "--- install Reverse Proxy ---"
#installieren
sudo apt-get install libapache2-mod-proxy-html
sudo apt-get install libxml2-dev

#Module aktivieren
sudo a2enmod proxy
sudo a2enmod proxy_html
sudo a2enmod proxy_http

#service neu starten
sudo service apache2 restart



echo "[OK] --- Entwicklungsumgebung abgeschlossen ---"
