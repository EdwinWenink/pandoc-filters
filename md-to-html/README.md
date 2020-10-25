# Converting your notes into a website

I sometimes like to publish part of my Zettelkasten into a more readable format that allows for some extra styling.
If we make sure that markdown links between files are correctly translated to `<href>` tags, we can follow those links in our browser. 

The following command calls a lua filter that achieves that.
It's quite trivial but important: the links refer to markdown documents, but have converted them to html and need to adjust the links accordingly.
The command below also takes care of some extra things.

Command:

`pandoc -s --toc --number-sections --section-divs --mathml --quiet --css "https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css" --lua-filter=md_to_html.lua test.md -o test.html`

- `s` gives us a standalone document with a proper header.
- `toc` gives us a table of content with clickable section headers
- `number-sections` numbers our headers hierarchically
* we need `section-divs` in to wrap individual sections in a div so we can style them
* `mathml` is an engine for rendering LaTeX formulas
- `css` is a link to our css styling; we need to insert this in the header of each individual page; using relative links tends to not work.

It is recommended to put above command in a script to render all documents that contain links to each other.
