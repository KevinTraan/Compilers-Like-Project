#!/usr/bin/bash

##### Run this script from the command line while in the testSuite directory #####

cd ../ptsrc
make scanner
cd ../testSuite/phase1
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
            ssltrace "ptc -o1 -t1 -L ../../ptsrc/lib/pt ${file}" ../../ptsrc/lib/pt/scan.def -e > ${file%.*}.eOutput
        fi
    done
done
