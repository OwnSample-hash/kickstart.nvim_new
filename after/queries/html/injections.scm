;extends
; ((element)
;   (start_tag
;     (tag_name) @_tag)
;   (#eq? @_tag "lua")
;   (#set! injection.language "lua")
;   (text) @injection.content)
; Vim: set expandtab tabstop=2 shiftwidth=2:
(element
  (start_tag
    (tag_name) @_tag)
  (text) @injection.content
  (#eq? @_tag "lua")
  (#set! injection.language "lua"))
