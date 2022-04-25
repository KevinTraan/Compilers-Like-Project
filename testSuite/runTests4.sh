#!/usr/bin/bash

# Run "make" in the /ptsrc directory
# chmod +x runTests4.sh
# Run this script from the command line while in the testSuite directory

cd ../ptsrc
make
cd ../testSuite/phase4
for path in * ; do
    [ -d "${path}" ] || continue # if not a directory, skip
    dirname="$(basename "${path}")"
    echo $dirname
    cd $dirname
    for file in ./*; do
        if [ ${file: -8} == ".eOutput" ] # delete ".eOutput" files
        then
            rm -f ${file}
        elif [ ${file: -4} == ".out" ] # delete ".out" files
        then
            rm -f ${file}
        elif [ ${file: -2} == ".s" ] # delete ".s" files
        then
            rm -f ${file}
        fi
        if [ ${file: -3} == ".pt" ]
        then
            if [ "$1" == "d" ]
            then : # Just leave all *.eOutput files deleted
            elif [ "$1" == "e" ] # run sanity check?
            then
                ptc -o4 -t4 -L ../../../ptsrc/lib/pt ${file} > ${file%.*}.eOutput
            elif [ "$1" == "s" ] # create ".s" files
            then
                ptc -S -L ../../../ptsrc/lib/pt ${file}
            elif [ "$1" == "i" ]
            then
                ssltrace "ptc -o4 -t4 -L ../../../ptsrc/lib/pt ${file}" ../../../ptsrc/lib/pt/coder.def -ei > ${file%.*}.eOutput
            else # create ".eOutput" and ".out" files
                ssltrace "ptc -o4 -t4 -L ../../../ptsrc/lib/pt ${file}" ../../../ptsrc/lib/pt/coder.def -e > ${file%.*}.eOutput
            fi
        fi
    done
    cd ..
done