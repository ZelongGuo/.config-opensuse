#bindkey '^v' edit-command-line
# list all bindkeys type the following command in csh/tcsh terminal: bindkey -l
bindkey -v
bindkey -a h vi-insert
bindkey -a H vi-insert-at-bol
bindkey -a j backward-char
bindkey -a l forward-char
bindkey -a J beginning-of-line
bindkey -a L end-of-line
bindkey -a k down-history
bindkey -a i up-history
bindkey -a u vi-undo

# #bindkey -M vicmd "-" vi-rev-repeat-search
# bindkey -M vicmd "=" vi-repeat-search
# bindkey -M vicmd "h" vi-forward-word-end
# 
# function zle-keymap-select {
# 	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
# 		echo -ne '\e[1 q'
# 	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
# 		echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# 
# # Use beam shape cursor on startup.
# echo -ne '\e[5 q'
# 
# # Use beam shape cursor for each new prompt.
# preexec() {
# 	echo -ne '\e[5 q'
# }
# 
# _fix_cursor() {
# 	echo -ne '\e[5 q'
# }
# precmd_functions+=(_fix_cursor)
# 
# KEYTIMEOUT=1
