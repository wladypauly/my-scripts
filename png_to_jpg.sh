#!/bin/bash
cd ~/ana_teorie
#ls -l ~/language_assessment
#for i in $(ls -l ~/language_assessment) ; do convert -quality 100 $i page-%d.jpg; done
for i in `ls *.png`; do convert "$i" "$i".jpg;
done
exit
