# Producing Beamer slides using Markdown

`slides.tex` is a `pandoc` template that allows you to easily and quickly produce good looking LaTeX beamer slides (e.g. lecture slides or slides for a conference talk ) using easy Markdown syntax.
It uses all the magic `pandoc` provides by default, with some additional custom options.

To produce slides, run:

`pandoc -s -t beamer --pdf-engine=xelatex --slide-level=2 --template=slides.tex filename.md -o filename.pdf`

For convenience, see `slidec.sh` so you don't have to type this command manually.

If you want to use the top-navigation, make sure you use `--slide-level=2`.
Then '#' will indicate section headers, and '##' will be slide headers.
If you do not care about sections you can use the default setting, which is `--slide-level=1`.
But make sure to disable the top navigation in that case.

*Opinionated*: uses xelatex for font-support.

## Custom YAML flags:

- `dark` : toggle dark theme
- `titlegraphic`: image to display on the first slide
- `section-page`: separate slide for section titles
- `titlefont`: separate font for slide titles (assumes xelatex due to fontspec)
    * If unspecified, `mainfont` will be used.
    * Note that fonts are specific to your system.
- `lecture-id`: if specified, use alternate title page format for lecture series, displaying the lecture id
- `no-caption-numbering`: disable the more formal caption numbering, like in "Figure 1";
- `no-caption-label`: show figure and table captions, but without the caption label, e.g. without "Figure: "
    * overrides other caption settings
- `quotebar`: show a bar left to quotes within quote environments
- `code-language`: which language to pass to the `lstlisting` environment when `listings: true` is passed in the YAML header.
    * Valid options are all languages that can be passed to the `listings` package.
- `python`: makes the `begin{code}` environment available with custom Python highlighting.

The template is based on the default pandoc template which already contains an abundance of options.
For example, you can change the aspect ratio via YAML as well.

- `aspectratio`
    * valid options: 169, 1610, 149, 54, 32
- you can also pass `geometry` arguments as a YAML list.

Have a closer look at the template itself for all options (there are many!).
You can see a simple example here: [`demo.md`](./demo.md).

Also note that `pandoc` is very flexible.
For example, if you need to customize an image (e.g. it's position or size), you can still include default LaTeX perfectly fine.

## Custom environments

### Code

Pandoc offers code highlighting for many languages out of the box, like this (see the markdown source):

```python
\begin{code}[frame=l]
import geopandas as gpd

# Load city boundaries
cities = gpd.read_file('cities.geojson')

# filter cities with a population greater than 1 million
filtered_cities = cities[cities['population'] > 1000000]
```

To get a bit more control over the styling and placement, setting `python: true` will make the `code` environment with custom Python code styling available.
The code font is a lot smaller and more suitable for slides.
Arguments are passed verbatim to `\lstset` from the `listings` package.
The following creates code with the custom `myPython` style, and overrides the frame parameter so only a line to the left is shown.

```
\begin{code}[frame=l]
import geopandas as gpd

# Load city boundaries
cities = gpd.read_file('cities.geojson')

# filter cities with a population greater than 1 million
filtered_cities = cities[cities['population'] > 1000000]
\end{code}
```

## Multi-columns

Pandoc supports multi-column layout per slide with this neat syntax:

```
::: columns

::: {.column width=50% }

\begin{scriptsize}
\begin{quote}
``I don't make coding mistakes because I'm just a computer program'' - ChatGPT
\end{quote}
\end{scriptsize}

When producing code, my experience is that ChatGPT often produces very good looking code, but sometimes it calls non-existing functions (that sound logical) or combines a method from one library (e.g. `geopandas`) on another (e.g. `pandas`).
:::

::: { .column width=50% }
\begin{code}[frame=l]
import geopandas as gpd

# Load city boundaries
cities = gpd.read_file('cities.geojson')

# filter cities with a population greater than 1 million
filtered_cities = cities[cities['population'] > 1000000]
\end{code}
:::

:::
```

If you don't require customization, you can just use `::: column` instead of the `::: {.column width=50%}` syntax.
You can use more than two columns if desired.

## Images

For images, you can use default markdown syntax, but additionally Pandoc offers you way more control.

You can for example adjust the size of the image: `![](file.jpg){ width=50% }`.
See the  [(docs)](https://pandoc.org/chunkedhtml-demo/8.17-images.html) for more information.

If you require more control, you can always fall back to using the LaTeX figure environment, e.g.:

```
\begin{figure}[t]
    \includegraphics[height=0.7\textheight]{fig.png}
    \centering
\end{figure}
```


## Backlog:

- Flags to include header navigation bar (e.g. top-nav) and footer information (currently enabled by default)
- Find a workaround that prevents top-level headers to not fall of the top navigation bar
    * Think there is a `compress` option?
- Maybe allow images on section pages if `section-page` is enabled [inspiration](https://tex.stackexchange.com/questions/404224/beamer-metropolis-theme-add-image-to-section-page)
    * Without `section-page` this already works by just inserting the image in the top-level section (i.e. `#`)
- Flag for letting items appear one by one
    * Check: `beamerdefaultoverlayspecification{<+->}`
- Regular markdown italics with `*cursive*` does not seem to work.
    * `\emph` also doesn't work, so apparently this styling is broken right now
- Add styling for blockquotes, i.e. using `>` in markdown.
- When giving a custom toc title, it appears as such with a number "Content I". I'd prefer it without the number.
- The page numbering is too far too the right
- More space in header and footer
