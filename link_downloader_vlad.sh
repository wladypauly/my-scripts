#!/bin/bash
#Script pentru descarcat fisiere partajate pe siteuri gen copy.com, shared.com, mega.co.nz.
for i in $(cat links.txt) ; do lynx --dump $i >> descarca ; done

grep key= descarca >> download
for i in $(cat download) ; do wget --content-disposition "$i"; done
exit 0
#explicatii>
# wget --content-disposition va spune lui wget sa urmeze indicatiile date in header-ul paginii html. Asta este util atunci cand descarcam fisiere puse la share pe site-uri gen shared.com, copy.com, dropbox.com, etc. si linkul de download nu contine expres numele fisierului (d.ex. www.site.com/de_descarcat.pdf) ci pur si simplu o legatura  dinamica de genul
#https://dl.shared.com/3ywcn1l5m3?tmp=1379253332&key=eea2bfddberghgee25e44265d2f12b3d0faea3a
#numele fisierelor "descarca", "download" pot fi schimbate cu ce vreti.
#Spor la descarcat!
