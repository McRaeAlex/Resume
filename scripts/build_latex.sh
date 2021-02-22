#!/bin/bash

function build_pdf {
    # Run the latex compiler on the input file
    pdflatex \
    -output-directory ./dist \
    -output-format pdf \
    src/resume.tex
}

function build_on_file_save {
    while inotifywait -e close_write ./src/resume.tex; do 
        build_pdf
    done
}


if [ "${CONTINOUS_BUILD}" == "TRUE" ]; then
    build_on_file_save
else
    build_pdf
fi
