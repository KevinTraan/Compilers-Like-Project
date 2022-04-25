#!/usr/bin/bash

# Run "make" in the semantic directory and copy semantic.def into semantic.pt
# chmod +x runTests3.sh
# Run this script from the command line while in the testSuite directory

cd ../ptsrc/parser
make
cd ../semantic
make
cd ../../testSuite/phase3
for path in * ; do
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    echo $dirname
    for file in "$dirname"/*; do
        if [ ${file: -8} == ".eOutput" ]
        then
            rm -f ${file}
        fi
        if [ ${file: -3} == ".pt" ]
        then
            if [ "$1" == "d" ]
            then : # Just leave all *.eOutput files deleted
            elif [ "$1" == "i" ]
            then
                ssltrace "ptc -o3 -t3 -L ../../ptsrc/lib/pt ${file}" ../../ptsrc/lib/pt/semantic.def -ei > ${file%.*}.eOutput
            elif [ "$1" == "g" ]
            then
                ssltrace "ptc -o3 -t3 -L ../../ptsrc/lib/pt ${file}" ../../ptsrc/lib/pt/semantic.def | egrep "^ *[\.o%]" > ${file%.*}.eOutput
            else
                ssltrace "ptc -o3 -t3 -L ../../ptsrc/lib/pt ${file}" ../../ptsrc/lib/pt/semantic.def -e > ${file%.*}.eOutput
            fi
        fi
    done
done
if [ "$1" == "d" ]
    then
        echo "All *.eOutput files deleted."
fi