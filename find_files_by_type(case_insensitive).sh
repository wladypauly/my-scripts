#!/bin/bash
#mkdir FILME_PERSONALE
mkdir ~/DICTIONARE
cd /media/wladypauly/1TB-B
IFS=$(echo -en "\n\b")
for i in $(find . -iname "*dictionar*"); do cp $i ~/DICTIONARE
done;
for i in $(find . -iname "*dictionary*"); do cp $i ~/DICTIONARE
done;

exit
#  explicatii: find cauta fisiere de tip .pdf in dosarul unde este rulat scriptul si le copiaza intr-un dosar numit PDFS.
# calea catre dosarul unde vor fi copiate fisierele poate fi schimbata cu orice
#extensii de fisiere video - mp4, avi, mpeg,
