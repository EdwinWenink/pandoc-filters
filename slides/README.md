# Producing Beamer slides using Markdown

`pandoc -s -t beamer --pdf-engine=xelatex --slide-level=2 --             template=slides.tex filename.md -o filename.pdf`

If you want to use the top-navigation, make sure you use `--slide-level=2`. 
Then '#' will indicate section headers, and '##' will be slide headers.
If you do not care about sections you can use the default setting, which is `--slide-level=1`.
But make sure to disable the top navigation in that case.

*Opinionated*: uses xelatex for font-support.

YAML flags:

- `dark` : toggle dark theme
- `titlegraphic`
- `section-page`: separate slide for section titles
- `mainfont`: select system font 
- `titlefont`: separate font for slide titles (assumes xelatex due to fontspec)
    * If unspecified, `mainfont` will be used.
- `lecture-id`: if specified, use alternate title page format for lecture series

Note that fonts are specific to your system.

For convenience, see `slidec.sh` and `demo.md`.

Backlog:

- Adjust resolution of slides
- Flags to include header navigation bar (e.g. top-nav) and footer information
- Deal with custom options for styling images in slides (e.g. fullscreen; image on right hand side)
