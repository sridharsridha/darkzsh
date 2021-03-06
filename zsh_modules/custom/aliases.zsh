alias c='clear'
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)
alias vf='pushd'
alias fv='popd'
alias cp='cp -iv'                            # Preferred 'cp' implementation
alias mv='mv -iv'                            # Preferred 'mv' implementation
alias gerp='grep'
alias sl='ls'
alias gentags='ctags -R .'
alias grep='grep -n'

alias tmux_capture_pane='tmux capture-pane -p -J -S - -E - | sed ‘s/[ \t]*$//’ | $EDITOR -'
