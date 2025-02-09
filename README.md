### Windows / Vim

Use vim and deoplete.nvim on Windows.

Use scoop and vim-plug.

#### how to use.

```markdown
# Use scoop.
scoop install vim

# use scoop
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force

# use wsl2
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Windows side Default.
mkdir GitHub

# Windows side Move.
cd GitHub

# WSL2 side, cd ~/ (home directory).
cd

# Clone.
git glone git@github.com:takkii/winvim.git

# move.
cd winvim

# Eliminate dependent libraries
pip3 install -r requirements.txt

# Create, .vimrc and .gvimrc
ruby install.rb

# Delete, .vimrc and .gvimrc
ruby delete.rb
```

※ No wiki required, very simple.
