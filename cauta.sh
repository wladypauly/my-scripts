#!/bin/sh
# Distributed under the terms of the GNU General Public License v3
# AUTHOR: Magic Banana
# e-mail: lcerf@dcc.ufmg.br

# The output file name is basename of the last matching file + $SUFFIX.pdf
SUFFIX='-matches'

# If called with no argument, show usage help and exit
if [ -z "$1" ]
then
    echo "Usage: `basename $0` [OPTION]... FILE.pdf [OTHER_FILE.pdf]...
Concatenate the pages (of the PDF files) that contain patterns.
The patterns are read from the standard input and end with an empty line.
They are, by default, basic regular expression (BRE).

OPTION can be:
  -E, --extended-regexp     patterns are extended regular expressions (ERE)
  -F, --fixed-strings       patterns are fixed strings
  -P, --perl-regexp         patterns are Perl regular expressions
  -i, --ignore-case         ignore case distinctions
  -w, --word-regexp         force patterns to match only whole words
  -x, --line-regexp         force patterns to match only whole lines"
    exit
fi

# Create in /tmp a basename for temporary files
TMP=`mktemp -t pdf-page-grep.XXXXXX`
# Those temporary files are removed when the script exits
trap "rm $TMP* 2>/dev/null" 0
# Read a mandatory pattern
while [ -z "$pattern" ]
do
    echo -n 'pattern: '
    read pattern
done
while [ -n "$pattern" ]
do
    # Store the pattern in a temporary file
    echo "$pattern" >> $TMP
    # Read optional additional patterns
    echo -n 'OR pattern (empty to stop): '
    read pattern
done

# Concatenate, in the variable "options", the options
for arg in "$@"
do
    # An option is an argument starting with "-"
    if [ `expr substr "$arg" 1 1` = '-' ]
    then
	options="$options $arg"
    fi
done

# Process the PDF files
for arg in "$@"
do
    # Every non-option argument is a PDF file to process
    if [ `expr substr "$arg" 1 1` != '-' ]
    then
	echo -n "
matching pages in \"$arg\":"
	# Get its number of pages and enumerate them one by one
	nbOfPages=`pdfinfo "$arg" | awk '$1 == "Pages:" { print $2 }'`
	for page in `seq $nbOfPages`
	do
	    # Search for the presence of at least one pattern in the page
	    if pdftotext -f $page -l $page "$arg" - | grep$options -qf $TMP
	    then
		# The page matches: print its number
		echo -n " $page"
		# Remember the page
		if [ -n "$sel" ]
		then
		    sel=$sel,
		fi
		sel=$sel$page
	    fi
	done
	if [ -n "$sel" ]
	then
	    # The PDF file matches: increment the number of matching files
	    nb=`expr $nb + 1`
	    # Extract the matching pages into a numbered temporary file
	    pdfjam -q -o $TMP-$nb "$arg" $sel
	    # Reset the matching pages for the next PDF file to process
	    sel=''
	    # Remember the basename of this PDF file (last match until now)
	    out=`basename "$arg" .pdf`
	fi
    fi
done
echo '
'
if [ -z "$nb" ]
then
    # No PDF file matched: exit returning 1
    echo 'No match!'
    exit 1
fi
if [ $nb -eq 1 ]
then
    # One single file matched: move the matching pages to the output file
    echo '1 matching PDF file'
    mv $TMP-1 "$out$SUFFIX.pdf"
else
    # Concatenate all matching pages in the order they were found
    echo "$nb matching PDF files"
    pdfunite $TMP-`seq -s " $TMP-" $nb` "$out$SUFFIX.pdf"
fi
# Inform the output file name
echo "Output written to \"$out$SUFFIX.pdf\""
