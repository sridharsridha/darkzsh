[[ -z "$PS1" ]] && return


# Install cheat.sh
CHEAT_SHELL=$HOME/bin/cheat
if [[ ! -d "$CHEAT_SHELL" ]]; then
	mkdir -p $CHEAT_SHELL
	curl https://cht.sh/:cht.sh > $CHEAT_SHELL/cht.sh
	chmod +x $CHEAT_SHELL/cht.sh
fi
export CHTSH_QUERY_OPTIONS="style=rrt"

# FZF
FZF_SHELL=$HOME/.zsh_modules/frameworks/fzf
if [[ ! -d "$FZF_SHELL" ]]; then
	echo "Installing fzf-shell."
	git clone https://github.com/junegunn/fzf.git "$FZF_SHELL"
	$HOME/.zsh_modules/frameworks/fzf/install --all
fi
export FZF_BASE=$HOME/.zsh_modules/frameworks/fzf

# Bash plugin manager
OH_MY_ZSH=$HOME/.zsh_modules/frameworks/oh-my-zsh
if [[ ! -d "$OH_MY_ZSH" ]]; then
	echo "Installing oh-my-zsh."
	git clone https://github.com/robbyrussell/oh-my-zsh.git "$OH_MY_ZSH"
fi
# Path to your oh-my-zsh installation.
ZSH=${HOME}/.zsh_modules/frameworks/oh-my-zsh
ZSH_CUSTOM=${HOME}/.zsh_modules/custom

# Paths {{{
###########
generic_paths=(
	$FZF_SHELL/bin
	$CHEAT_SHELL
)
function workon_generic() {
	PATH=$PATH:$(
	IFS=:
	echo "${generic_paths[*]}"
)
export PATH
}
# Enable default exports
workon_generic
#}}}


ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	cheat
	gitignore
	zsh_reload
	safe-paste
	fzf
	history
	history-substring-search
	zsh-completions
	zsh-autosuggestions
)

# zsh-syntax-highlighting needs to be at the end of all plugins
plugins+=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
# Load the private bash config files
CUSTOM="${HOME}/.zshrc.local"
if [[ -e "${CUSTOM}" ]]; then
	# shellcheck disable=SC1090
	source $CUSTOM
fi

# fzf support
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(~/.zsh.d/ $fpath)
