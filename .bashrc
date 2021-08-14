### Bash Config - Robert Bornschein ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Bash.D Config #
BASHD_HOME=${HOME}/.config/bash.d
BASHD_ALIASES=${BASHD_HOME}/aliases.sh
BASHD_FUNCTIONS=${BASHD_HOME}/functions
BASHD_EXPORTS=${BASHD_HOME}/exports.sh
BASHD_MISC=${BASHD_HOME}/misc.sh

test -f ${BASHD_ALIASES} && . ${BASHD_ALIASES}
test -f ${BASHD_EXPORTS} && . ${BASHD_EXPORTS}
test -f ${BASHD_MISC} && . ${BASHD_MISC}
# Bash.D Config #

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# NVM

