### Bash.d Configuration - Robert Bornschein ###

# Miscellaneous #
set -o vi
# Miscellaneous #

# Load Aliases #
for path in ${ALIASES_PATH//:/ }; do
  test -f $path && . $path
done
