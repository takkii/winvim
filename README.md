### Windows / Vim

Use vim and deoplete.nvim on Windows.

Use scoop and vim-plug.

#### how to use.

```markdown
# Use scoop.
scoop install vim

# use vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force

# Default, folder directroy
mkdir GitHub

# Move.
cd GitHub

# Clone.
git glone git@github.com:takkii/winvim.git

# move.
cd winvim

# Eliminate dependent libraries
pip3 install -r requirements.txt

# Create, .vimrc and .gvimrc
ruby win_install.rb

# Delete, .vimrc and .gvimrc
ruby delete.rb
```

※ No wiki required, very simple.
