#!/bin/bash
#script pentru sincronizat datele prin webdav in cloud digistorage.
#NB!! Scriptul nu sterge fisierele vechi, asa ca este necesar sa verifici din cand in cand ce fisiere nu mai trebuie
mount /media/DIGI #Se moteaza local partitia DIGI cerespunzatoare cloud-lui
rsync -azuv --inplace --progress ~/Documents/ /media/DIGI/Digi\ Cloud/SYNC/
#Source folders>
#DIR1="~/Documents/ALL_BOUT_LINUX/"
#DIR2="~/Documents/AN_SCOLAR_2015-2016_TOPILE/"
#DIR3="~/Documents/APA_VITAL/"
#DIR4="~/Documents/ARTICOLE_PRESA/"
#DIR5="~/Documents/ARTICOLE_UNIKBIT/"
#DIR6="~/Documents/Can\ Pope/"
#DIR7="~/Documents/centralizator\ 2016-2017/"
#DIR8="~/Documents/DIVERSE/"
#DIR9="~/Documents/EBOOKS/"
#DIR10="~/Documents/Finnegans_wake_site/"
#DIR11="~/Documents/Kubuntu_BACKUP/"
#DIR12="~/Documents/MY_WEBSITES/"
#DIR13="~/Documents/NOTITE_TITULARIZARE_METODICA/"
#DIR14="~/Documents/ODISEEA_APA_VITAL/"
#DIR15="~/Documents/samsung/"
#DIR16="~/Documents/TVMAXE_WINDOWS/"
#DIR17="~/Documents/VOICES/"
#DESTINATION
#DEST1="/media/DIGI/Digi\ Cloud/SYNC/ALL_BOUT_LINUX/"
#DEST2="/media/DIGI/Digi\ Cloud/SYNC/AN_SCOLAR_2015-2016_TOPILE/"
#DEST3="/media/DIGI/Digi\ Cloud/SYNC/APA_VITAL/"
#DEST4="/media/DIGI/Digi\ Cloud/SYNC/ARTICOLE_PRESA"
#DEST5="/media/DIGI/Digi\ Cloud/SYNC/ARTICOLE_UNIKBIT/"
#DEST6="/media/DIGI/Digi\ Cloud/SYNC/Can\ Pope/"
#DEST7="/media/DIGI/Digi\ Cloud/SYNC/centralizator\ 2016-2017/"
#DEST8="/media/DIGI/Digi\ Cloud/SYNC/DIVERSE/"
#DEST9="/media/DIGI/Digi\ Cloud/SYNC/EBOOKS/"
#DEST1="/media/DIGI/Digi\ Cloud/SYNC/Finnegans_wake_site/"
#DEST11="/media/DIGI/Digi\ Cloud/Kubuntu_BACKUP/"
#DEST12="/media/DIGI/Digi\ Cloud/SYNC/MY_WEBSITES/"
#DEST13="/media/DIGI/Digi\ Cloud/SYNC/NOTITE_TITULARIZARE_METODICA/"
#DEST14="/media/DIGI/Digi\ Cloud/SYNC/ODISEEA_APA_VITAL/"
#DEST15="/media/DIGI/Digi\ Cloud/SYNC/samsung/"
#DEST16="/media/DIGI/Digi\ Cloud/SYNC/TVMAXE_WINDOWS/"
#DEST17="/media/DIGI/Digi\ Cloud/SYNC/VOICES/"
##############################################
##About options in rsync (http://linux.die.net/man/1/rsync)
#--delete
    #This tells rsync to delete extraneous files from the receiving side (ones that aren't on the sending side), but only for the directories that are being synchronized.
#-n, --dry-run
    #This makes rsync perform a trial run that doesn't make any changes (and produces mostly the same output as a real run). It is most commonly used in combination with the -v, --verbose
#--inplace
    #This option changes how rsync transfers a file when the file's data needs to be updated: instead of the default method of creating a new copy of the file and moving it into place when it is complete, rsync instead writes the updated data directly to the destination file. This has several effects: (1) in-use binaries cannot be updated (either the
    #OS will prevent this from happening, or binaries that attempt to swap-in their data will misbehave or crash), (2) the file's data will be in an inconsistent state during the transfer, (3) a file's data may be left in an inconsistent state after the transfer if the transfer is interrupted or if an update fails, (4) a file that does not have write permissions can not be updated, and (5) the efficiency of rsync's delta-transfer algorithm may be reduced if some data in the destination file is overwritten before it can be copied to a position later in the file (one exception to this is if you combine this option with --backup, since rsync is smart enough to use the backup file as the basis file for the transfer).
    #WARNING: you should not use this option to update files that are being accessed by others, so be careful when choosing to use this for a copy.
    #This option is useful for transfer of large files with block-based changes or appended data, and also on systems that are disk bound, not network bound.
    #The option implies --partial (since an interrupted transfer does not delete the file), but conflicts with --partial-dir and --delay-updates. Prior to rsync 2.6.4 --inplace was also incompatible with --compare-dest and --link-dest.
#-u, --update
    #This forces rsync to skip any files which exist on the destination and have a modified time that is newer than the source file. (If an existing destination file has a modification time equal to the source file's, it will be updated if the sizes are different.) Note that this does not affect the copying of symlinks or other special  files. Also, a difference of file format between the sender and receiver is always considered to be important enough for an update, no matter what date is on the objects. In other words, if the source has a directory where the destination has a file, the transfer would occur regardless of the timestamps. This option is a transfer rule, not an exclude, so it doesn't affect thedata that goes into the file-lists, and thus it doesn't affect deletions. It just limits the files that the receiver requests to be transferred.
#
