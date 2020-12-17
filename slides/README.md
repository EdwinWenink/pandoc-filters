# Producing Beamer slides using Markdown

`slides.tex` is a `pandoc` template that allows you to easily and quickly produce good looking LaTeX beamer slides (e.g. lecture slides or slides for a conference talk ) using easy Markdown syntax.
It uses all the magic `pandoc` provides by default, with some additional custom options.

To produce slides, run:

`pandoc -s -t beamer --pdf-engine=xelatex --slide-level=2 --             template=slides.tex filename.md -o filename.pdf`

For convenience, see `slidec.sh` so you don't have to type this command manually.

If you want to use the top-navigation, make sure you use `--slide-level=2`. 
Then '#' will indicate section headers, and '##' will be slide headers.
If you do not care about sections you can use the default setting, which is `--slide-level=1`.
But make sure to disable the top navigation in that case.

*Opinionated*: uses xelatex for font-support.

Custom YAML flags:

- `dark` : toggle dark theme
- `titlegraphic`: image to display on the first slide
- `section-page`: separate slide for section titles
- `titlefont`: separate font for slide titles (assumes xelatex due to fontspec)
    * If unspecified, `mainfont` will be used.
    * Note that fonts are specific to your system.
- `lecture-id`: if specified, use alternate title page format for lecture series, displaying the lecture id

The template is based on the default pandoc template which already contains an abundance of options.
For example, you can change the aspect ratio via YAML as well

- `aspectratio` 
    * valid options: 169, 1610, 149, 54, 32

You can see a simple example here: [`demo.md`](./demo.md).

Also note that `pandoc` is very flexible.
For example, if you need to customize an image (e.g. it's position or size), you can still include default LaTeX perfectly fine.

Backlog:

- Flags to include header navigation bar (e.g. top-nav) and footer information
