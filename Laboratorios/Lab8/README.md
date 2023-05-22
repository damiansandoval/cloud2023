Instalamos Ubuntu 20.04 porque las otras amis se rompen!

    Apache (httpd) (apache2 en ubuntu)
        Se instala como dependencia al momento de instalar php5.6    


    PHP5.6
        comandos:
            sudo apt update
            sudo apt install -y software-properties-common
            sudo add-apt-repository -y ppa:ondrej/php
            sudo apt update
            sudo apt install -y php5.6 php5.6-cli php5.6-common php5.6-mbstring php5.6-mysql php5.6-curl php5.6-gd php5.6-xml php5.6-zip


    MySQL 5.6 o 5.7 (el cliente no anda de momento en Ubuntu)

    Conector apache mysql (en Amazon linux se llama php-mysql y en Ubuntu tambien)
        comandos:    
            sudo apt install -y php-mysql

Referencias:
https://launchpad.net/~ondrej/+archive/ubuntu/php


# Hola soy un encabezado

* Aca hago un punteo y eso
* otra cosa



1) mas cosas
2) otras



**aca pongo algo en negrita**

*aca en cursiva*

