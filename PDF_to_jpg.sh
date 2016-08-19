#!/bin/bash
cd ~/language_assessment
#ls -l ~/language_assessment
#for i in $(ls -l ~/language_assessment) ; do convert -quality 100 $i page-%d.jpg; done
for i in `ls *.pdf`; do convert "$i" "$i".jpg; done
exit
