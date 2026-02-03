bindkey -v
bindkey "^R"              widget::history       # C-r
bindkey "^G"              widget::ghq::session  # C-g
bindkey "^[g"             widget::ghq::dir      # Alt-g
bindkey -M viins "^A"     beginning-of-line     # C-a
bindkey -M viins "^E"     end-of-line           # C-e
bindkey -M viins "^P"     widget::filepath      # C-p
bindkey -M vicmd "/"      widget::history       # /