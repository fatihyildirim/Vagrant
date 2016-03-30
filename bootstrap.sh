#! /usr/bin/env bash

#update the box
sudo apt-get update
echo -e "\n--- Install base packages ---\n"
sudo apt-get -y install vim curl build-essential python-software-properties libssl-dev
sudo apt-get -y install python-dev python-setuptools
sudo apt-get install -y libtiff5-dev libjpeg62-turbo-dev
sudo apt-get install -y libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk

sudo apt-get install -y build-dep python-imaging
sudo apt-get install -y libjpeg8 libjpeg62-dev libfreetype6 libfreetype6-dev
sudo apt-get install -y python-dev libjpeg-dev libfreetype6-dev zlib1g-dev

sudo apt-get remove --purge node

echo -e "\n--- Install python-pip ---\n"
sudo apt-get -y install python-pip

echo -e "\n--- Install virtualenv ---\n"
sudo apt-get install -y python-virtualenv

echo -e "\n--- Install sqlite ---\n"
sudo apt-get install -y sqlite3 libsqlite3-dev

echo -e "\n--- Install apache2 ---\n"
sudo apt-get install -y apache2
sudo apt-get install -y libapache2-mod-wsgi
sudo service apache2 restart

sudo mkdir -p /vagrant/www
sudo mkdir -p /vagrant/projects

echo -e "\n--- Virtualenv installation ---\n"
cd /vagrant/projects
virtualenv env

echo -e "\n--- change projects/www folder ownership ---\n"
sudo chown -R vagrant:vagrant /vagrant/projects
sudo chown -R vagrant:vagrant /vagrant/www

echo -e "\n--- Git installation ---\n"
sudo apt-get -y install git

# echo -e "\n--- Oh My ZSH ---\n"
# sudo apt-get -y install zsh
# sudo apt-get -y install git-core
# wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo -e "\n--- Virtualenv working ---\n"
cd /vagrant/projects
source env/bin/activate

echo -e "\n--- Django installation ---\n"
pip install django

echo -e "\n--- Django environment installation ---\n"
pip install django-suit==0.2.16
pip install django-suit-ckeditor
pip install Pillow
pip install https://github.com/realsby/public_files/blob/master/PIL-Imaging-1.1.7.tar.gz?raw=true
pip install django-media-manager
pip install django-filter
pip install django-mptt


echo -e "\n--- Start Project ---\n"
cd /vagrant/projects
django-admin startproject mysite

echo -e "\n--- Project Detail Work ---\n"
cd /vagrant/projects/mysite
git init
python manage.py migrate




