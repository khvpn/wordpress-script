#!/bin/bash

showMe(){

echo " ██▓     ██▓ ███▄    █  █    ██ ▒██   ██▒     ██████▓██   ██▓ ██▀███  ";
echo "▓██▒    ▓██▒ ██ ▀█   █  ██  ▓██▒▒▒ █ █ ▒░   ▒██    ▒ ▒██  ██▒▓██ ▒ ██▒";
echo "▒██░    ▒██▒▓██  ▀█ ██▒▓██  ▒██░░░  █   ░   ░ ▓██▄    ▒██ ██░▓██ ░▄█ ▒";
echo "▒██░    ░██░▓██▒  ▐▌██▒▓▓█  ░██░ ░ █ █ ▒      ▒   ██▒ ░ ▐██▓░▒██▀▀█▄  ":
echo "░██████▒░██░▒██░   ▓██░▒▒█████▓ ▒██▒ ▒██▒   ▒██████▒▒ ░ ██▒▓░░██▓ ▒██▒";
echo "░ ▒░▓  ░░▓  ░ ▒░   ▒ ▒ ░▒▓▒ ▒ ▒ ▒▒ ░ ░▓ ░   ▒ ▒▓▒ ▒ ░  ██▒▒▒ ░ ▒▓ ░▒▓░";
echo "░ ░ ▒  ░ ▒ ░░ ░░   ░ ▒░░░▒░ ░ ░ ░░   ░▒ ░   ░ ░▒  ░ ░▓██ ░▒░   ░▒ ░ ▒░";
echo "  ░ ░    ▒ ░   ░   ░ ░  ░░░ ░ ░  ░    ░     ░  ░  ░  ▒ ▒ ░░    ░░   ░ ";
echo "    ░  ░ ░           ░    ░      ░    ░           ░  ░ ░        ░     ";
echo "                                                     ░ ░             ";
}


showMe
sleep 2s
reset
echo "starting....";

rotateCursor() {
s="-,\\,|,/"
    for i in `seq 1 $1`; do
        for i in ${s//,/ }; do
            echo -n $i
            sleep 0.1
            echo -ne '\b'
        done
    done
}

rotateCursor
rotateCursor 10

check_os () {
    echo "Checking your OS"
echo ===================
lsb_release -a
}

installation_22.04 () {
    echo "Die Installation ist begonnen..."
#LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL

mv /etc/hosts /etc/hosts.backup
cat > /etc/hosts << 'EOL'
127.0.0.1		localhost
96.43.86.60		gplth.com
EOL
cat > /etc/hostname << 'EOL'
gplth
EOL
apt install apache2 mariadb-server -y
sudo systemctl enable apache2
reset
echo "apache2 and Mariadb installed successfully ";

rotateCursor() {
s="-,\\,|,/"
    for i in `seq 1 $1`; do
        for i in ${s//,/ }; do
            echo -n $i
            sleep 0.1
            echo -ne '\b'
        done
    done
}

rotateCursor
rotateCursor 10

add-apt-repository ppa:ondrej/php --yes &> /dev/null
apt install php7.4 libapache2-mod-php7.4 php7.4-{mysql,intl,curl,json,gd,xml,mbstring,zip} -y
apt-get install libapache2-mod-php7.4 -y
apt install php*-common php7.4-mysql -y

reset
echo "php and extensions installed successfully ";

rotateCursor() {
s="-,\\,|,/"
    for i in `seq 1 $1`; do
        for i in ${s//,/ }; do
            echo -n $i
            sleep 0.1
            echo -ne '\b'
        done
    done
}

rotateCursor
rotateCursor 10

mysql --password=Be089727107@ --user=root --host=localhost << EOF
create database gplth123;
grant all privileges on gplth123.* to root@localhost identified by "Be089727107@";
flush privileges;
EOF

reset
echo "db configured successfully ";

rotateCursor() {
s="-,\\,|,/"
    for i in `seq 1 $1`; do
        for i in ${s//,/ }; do
            echo -n $i
            sleep 0.1
            echo -ne '\b'
        done
    done
}

rotateCursor
rotateCursor 10


sudo apt install wget unzip
wget https://wordpress.org/latest.zip
sudo unzip latest.zip
mv /var/www/html/ /var/www/htmlbackup ; mkdir /var/www/html/
sudo chown www-data:www-data -R /var/www/html/
sudo chmod -R 755 /var/www/html/
cd wordpress
sudo mv * /var/www/html/
sudo rm latest.zip
sudo chown www-data:www-data -R /var/www/html/
sudo chmod -R 755 /var/www/html/

reset
echo "wordpress installed successfully ";

rotateCursor() {
s="-,\\,|,/"
    for i in `seq 1 $1`; do
        for i in ${s//,/ }; do
            echo -n $i
            sleep 0.1
            echo -ne '\b'
        done
    done
}

rotateCursor
rotateCursor 10

cat > /etc/apache2/sites-available/wordpress.conf << 'EOL'
<VirtualHost *:80>

ServerAdmin root@gplth.com

DocumentRoot /var/www/html/
ServerName gplth.com
ServerAlias www.gplth.com

<Directory /var/www/html/>

Options FollowSymLinks
AllowOverride All
Require all granted

</Directory>

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOL
sudo a2ensite wordpress.conf
sudo a2enmod rewrite
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
firefox -new-tab "http://gplth.com/wp-admin/setup-config.php"
sudo apt autoremovereset
echo "wordpress installed successfully ";

rotateCursor() {
s="-,\\,|,/"
    for i in `seq 1 $1`; do
        for i in ${s//,/ }; do
            echo -n $i
            sleep 0.1
            echo -ne '\b'
        done
    done
}

rotateCursor
rotateCursor 10

#LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
reset
BIGreen='\033[1;92m'
printf  "${BIGreen} * wordpress installed "
printf  "${BIGreen} * http://gplth.com"
printf  "${BIGreen} * visit the site to complete configure it "

}

installation_other () {

#ssl installation

sudo a2enmod ssl
sudo systemctl restart apache2
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
cat > /etc/apache2/sites-available/wordpress.conf << 'EOL'
<VirtualHost *:443>

ServerAdmin root@gplth.com

DocumentRoot /var/www/html/
ServerName gplth.com
ServerAlias www.gplth.com

   SSLEngine on
   SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt
   SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key
<Directory /var/www/html/>

Options FollowSymLinks
AllowOverride All
Require all granted

</Directory>

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOL
sudo a2ensite wordpress.conf
service apache2 restart
sudo ufw allow "Apache Full"
echo "ssl installed";
#ssl installation ended

}

while true; do
    options=("Checking your OS" "install for ubuntu 22.04 and above" "install self sigend ssl")

    echo "Choose an option:"
    select opt in "${options[@]}"; do
        case $REPLY in
            1) check_os; break ;;
            2) installation_22.04; break ;;
            3) installation_other; break ;;
            *) echo "i cant understand your entrie, choose 1 or 2.." >&2
        esac
    done

    echo "Have you checked your OS Rlease && installed?"
    select opt in "No, break the installation" "Yes, go back to installation"; do
        case $REPLY in
            1) break 2 ;;
            2) break ;;
            *) echo "Look, it's a simple question...enter 1 or 2...etc" >&2
        esac
    done
done
