#!/bin/sh
#Script pentru instalat driver-ul de pe site-ul Samsung.
#Dezinstalare driver din depozitele oficiale:
sudo apt-get purge printer-driver-splix
#Descărcare driver (luat de pe site-ul Samsung și pus pe Dropbox - site-ul Samsung este dinamic, nu există link direct de descărcare):
cd $HOME
wget https://www.dropbox.com/s/thbpryulhc2q0qu/ULD_v1.00.35.tar.gz
#Dezarhivare:
tar zxvf ULD_v1.00.35.tar.gz
#Intrăm în dosarul cu driverul dezarhivat:
cd uld
#Facem fișierul executabil:
chmod +x install.sh
#Pornim instalarea:
sudo ./install.sh
exit
