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
- `mainfont`: select system font (assumes xelatex)
