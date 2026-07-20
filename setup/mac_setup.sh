# install xcode
xcode-select --install

# install and setup homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# set bashrc -> bash_profile
ln -s ~/Git/templates/dotfiles/bashrc ~/.bash_profile
ln -s ~/Git/templates/dotfiles/vimrc ~/.vimrc
source ~/.bash_profile

# build and config tools
brew install cmake
brew install pkg-config

# install gcc compiler tools and set as defaults
brew install gfortran

ln -s /opt/homebrew/bin/g++-14 /opt/homebrew/bin/g++
ln -s /opt/homebrew/bin/gcc-14 /opt/homebrew/bin/gcc
ln -s /opt/homebrew/bin/c++-14 /opt/homebrew/bin/c++
ln -s /opt/homebrew/bin/cpp-14 /opt/homebrew/bin/cpp

# install command line latex (pdflatex, lualatex, etc)
brew install --cask mactex-no-gui

# other useful utils
brew install dbus-glib
dbus-uuidgen --ensure=/opt/homebrew/var/lib/dbus/machine-id
brew install libnotify
brew install openmpi
brew install poppler
brew install tmux

# install python3, pip3, and uv
brew install python3
curl -LsSf https://astral.sh/uv/install.sh | sh

# install python packages
python3 -m pip install --break-system-packages --user -r PYTHON_REQUIREMENTS
