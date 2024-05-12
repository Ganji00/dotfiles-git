How to install the dotfiles.

1. create an alias:
`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

2. ignore the clone folder:
`echo ".cfg" >> .gitignore`

3. Clone the repository:
`git clone --bare <git-repo-url> $HOME/.dotfiles`

4. Checkout the actual content form the bare repository into your `$HOME`:
`dotfiles checkout`


