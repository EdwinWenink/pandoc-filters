# Description

*tikz.lua* operates as a lua filter to render TikZ figures in .tex files ready for conversion to other file formats with pandoc.

# Requirements

- pdflatex 
- pdftoppm
- [latexpand](https://www.ctan.org/pkg/latexpand)
- [poppler](https://gist.github.com/Dayjo/618794d4ff37bb82ddfb02c63b450a81)

In the filter, indicate additional TikZ libraries you have used. 

# Pandoc Syntax

Add `--from latex+raw_tex --lua-filter=tikz.lua` to command to run;

It might be necessary to use `latexpand` when using `\include` in your .tex file:

`latexpand filename.tex | pandoc --from latex+raw_tex --lua-filter=tikz.lua -o filename.docx`

# Sources

## Filter

- Original version: [Pandoc Documentation](https://pandoc.org/lua-filters.html)
- Updated version: [StackExchange](https://tex.stackexchange.com/questions/567594/how-to-use-pandoc-to-convert-tex-file-containing-a-tikz-figure-to-a-docx-fil)

