text = require 'text'
canon = '../' -- assumes relative URLs and flat file directory; adjust as needed

function Link(el)
    el.target = string.gsub(el.target, "%.md", "")
    -- e.g. in Hugo disablePathToLower=false is default behavior
    -- this is only needed because I only use the filename in my markdown links
    -- Do not prepend path is target is an URL
    if not string.find(el.target, "http") then
        el.target = canon .. text.lower( el.target )
    end
    return el
end
