### Bash Config - Robert Bornschein ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Bash.D Config #
BASHD_HOME=${HOME}/.config/bash.d
BASHD_FUNCTIONS=${BASHD_HOME}/functions
BASHD_EXPORTS=${BASHD_HOME}/exports.sh
BASHD_MISC=${BASHD_HOME}/misc.sh
BASHD_RUN=${BASHD_HOME}/run.sh

test -f ${BASHD_EXPORTS} && . ${BASHD_EXPORTS}
test -f ${BASHD_MISC} && . ${BASHD_MISC}
test -f ${BASHD_RUN} && . ${BASHD_RUN}

for file in $(ls $BASHD_FUNCTIONS); do
  test -f $BASHD_FUNCTIONS/$file && . $BASHD_FUNCTIONS/$file;
done
# Bash.D Config #

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# NVM


eval "$(thefuck --alias)"
