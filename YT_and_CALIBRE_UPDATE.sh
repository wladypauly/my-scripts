#!/bin/bash
zenity --info --title="SCRIPT" --width=600 --height=200 --text="Author: wladypauly <span color =\'red\'>READ CAREFULLY THROUGHOUT. THIS SCRIPT REQUIRES ROOT!!!!!</span>";
TEXT1=`zenity --width=400 --height=350 --question --title="SURE?" --text="WOULD LIKE TO GO ON?"; echo $?`;
if [ $TEXT1 -eq 1 ]
then
zenity --error --width=600 --height=150 --text="OPERATION ABORTED. BYE!";exit
else
TEXT2=`zenity --question --width=400 --height=150 --title="YOUTUBE-DL" --text="<span><b>DOWNLOADING REQUIRED FILES. PROCEEED?</b></span>"; echo $?`;
fi;
if [ $TEXT2 -eq 1 ]
then
zenity --error --width=400 --height=150 --text="OPERATION ABORTED. BYE!";exit
else
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl | zenity --progress --pulsate --auto-close --auto-kill --text="DOWNLOADING..."
fi;
zenity --info --width=400 --height=150 --title="BIT" --text="SETTING THE EXECUTABLE BIT."
sudo chmod a+rx /usr/local/bin/youtube-dl
zenity --info --width=600 --height=150 --text="ALL DONE. YOU CAN NOW RUN YOUTUBE-DL IN CLI"
TEXT3=`zenity --width=600 --height=150 --question --title="CALIBRE" --text="WANNA GO FOR CALIBRE UPDATE/INSTALLATION? (Y/N)"; echo $?`;
if [ $TEXT3 -eq 1 ]
then zenity --width=600 --height=150 --error --text="OPERATION ABORTED. BYE!";exit
else
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin  | zenity --progress --pulsate --auto-close --auto-kill --text="INSTALLING..."
fi;
zenity --info --width=300 --height=150 --title="FINAL" --text="ALL SET!"
exit
