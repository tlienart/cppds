function poor_parser(s)
    lines = split(s, '\n')
    docstrings = String[]
    open = false
    curds = ""
    for line in lines
        startswith(line, "/**") && (open = true)
        if open
            curds *= line * "\n"
            if endswith(line, "*/")
                push!(docstrings, strip(curds))
                curds = ""
                open = false
            end
        end
    end
    return docstrings
end

function hfun_docstring(args)
    r = ""
    for ds in poor_parser(read(args[1], String))
      r *= "<pre><code>$ds</code></pre>"
    end
    return r
end
