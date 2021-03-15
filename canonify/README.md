# Ad-hoc URL manipulation

This lua filter solves an annoying problem I have when trying to use my Zettelkasten notes in combination with Hugo.

My notes link to files in a flat file system and look like this `[description](target.md)`. 
That is, I don't make any assumption about file structure.
I myself use a flat file structure and even if I wouldn't, Vim could figure out where the file is with a recursive search.

Problems:

1. Hugo renders content with pretty URLs by default, i.e. without extension
2. Hugo converts all paths to lowercase by default
3. On top of that, I use relative links. 

This requires three fixes to make default Markdown links work without using default Hugo functions `ref` or `relRef`, which I don't want in my files because I don't want my content to only display nicely with Hugo!

1. Remove extension
2. Convert to lower case
3. Prepend a base URL to resolve the relative link correctly (assuming flat Zettelkästen structure)

So this script is very specific to my needs, but may serve as inspiration for someone else. It's easy to adapt.
