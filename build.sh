#!/bin/sh

create_bin="n"

set -e

if [ ! $1 ]; then
    echo "Provide a filename to compile!"
    exit 1
fi

if [ ! -f $1.asm ]; then
    echo "Provided filename doesn't corespond to an exisitng file!"
    exit 1
fi

if [ ! -d "./bin/" ]; then
    echo "bin directory doesn't exist"

    read -p "Should I create one? (y/N) " create_bin

    if [ ! $create_bin ]; then
        exit 1
    fi

    if [ $create_bin = "y" ]; then
        mkdir bin
    else
        exit 1
    fi
fi

cd bin

if [ -d "$1" ]; then
    cd $1
else
    mkdir $1 && cd $1
fi

yasm -Worphan-labels -g dwarf2 -f elf64 ../../$1.asm -o $1.o -l $1.lst
ld -g -o $1 $1.o

echo "Compilation successful!"
