-- In LaTeX, Quarto titles a numbered note callout "Note N" and ignores
-- crossref-nte-title, so exercises (#nte-ex-*) would read "Note 2.7" in the
-- PDF. Retitle them "Exercise", as on the web. Runs post-render, once the
-- callouts have been turned into tcolorbox LaTeX.

local function retitle(el)
  if el.format:match("latex") then
    el.text = el.text:gsub("{Note \\ref%*{nte%-ex%-", "{Exercise \\ref*{nte-ex-")
    return el
  end
end

return {
  { RawInline = retitle, RawBlock = retitle },
}
