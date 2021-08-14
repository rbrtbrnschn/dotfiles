# Dotfiles
*by Robert Bornschein*

### How to migrate to these dotfiles?

Glad you asked future Robert. Past you got you covered!

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore

# Depending on your setup
git clone --bare git@github.com:rbrtbrnschn/dotfiles.git $HOME/.cfg
git clone --bare https://github.com/rbrtbrnschn/dotfiles.git $HOME/.cfg

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Backup Current ~/.config!
config checkout
config config --local status.showUntrackedFiles no
```

And here is the URL, just in [case](https://www.atlassian.com/git/tutorials/dotfiles).

