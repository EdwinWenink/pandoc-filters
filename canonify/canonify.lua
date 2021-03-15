text = require 'text'
canon = '../' -- assumes relative URLs and flat file directory; adjust as needed

function Link(el)
    el.target = string.gsub(el.target, "%.md", "")
    -- e.g. in Hugo disablePathToLower=false is default behavior
    -- this is only needed because I only use the filename in my markdown links
    el.target = canon .. text.lower( el.target )
    return el
end
