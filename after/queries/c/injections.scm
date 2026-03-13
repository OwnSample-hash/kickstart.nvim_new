; Doxygen injection for C
; Place this file at: after/queries/c/injections.scm
; (inside your Neovim config, e.g. ~/.config/nvim/after/queries/c/injections.scm)

; Match /** ... */ block comments (Doxygen-style)
((comment) @injection.content
  (#match? @injection.content "^/[*][*]")
  (#set! injection.language "doxygen")
  (#set! injection.include-children))

; Match /*! ... */ block comments (Qt-style Doxygen)
((comment) @injection.content
  (#match? @injection.content "^/[*]!")
  (#set! injection.language "doxygen")
  (#set! injection.include-children))

; Match ///  line comments (triple-slash Doxygen)
((comment) @injection.content
  (#match? @injection.content "^///")
  (#set! injection.language "doxygen")
  (#set! injection.include-children))

; Match //! line comments (Qt-style Doxygen line comments)
((comment) @injection.content
  (#match? @injection.content "^//!")
  (#set! injection.language "doxygen")
  (#set! injection.include-children))
