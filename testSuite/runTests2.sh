#!/usr/bin/bash

##### Run this script from the command line while in the testSuite directory #####

cd ../ptsrc/parser
make
cd ../../testSuite/phase2
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
            if [ "$1" == "i" ]
            then
                ssltrace "ptc -o2 -t2 -L ../../ptsrc/lib/pt ${file}" ../../ptsrc/lib/pt/parser.def -ei > ${file%.*}.eOutput
            else
                ssltrace "ptc -o2 -t2 -L ../../ptsrc/lib/pt ${file}" ../../ptsrc/lib/pt/parser.def -e > ${file%.*}.eOutput
            fi

        fi
    done
done
