#!/bin/bash
if [ "$#" -eq "0" ]
    then
        echo "Pass a suitable markdown file"
    else
        echo "Compiling slides ..."
        file=$(basename "$1$")
        filename=${file%.*}
        pandoc -s -t beamer --pdf-engine=xelatex --slide-level=2 --template=slides.tex "$@" -o "$filename".pdf
fi
