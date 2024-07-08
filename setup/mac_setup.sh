# install xcode
xcode-select --install

# set bashrc -> bash_profile
mv ~/.bashrc ~/.bash_profile

# install and setup homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/tylerchang/.bash_profile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install gcc compiler tools and set as defaults
brew install gfortran

ln -s /opt/homebrew/bin/g++-14 /opt/homebrew/bin/g++
ln -s /opt/homebrew/bin/gcc-14 /opt/homebrew/bin/gcc
ln -s /opt/homebrew/bin/c++-14 /opt/homebrew/bin/c++
ln -s /opt/homebrew/bin/cpp-14 /opt/homebrew/bin/cpp

# install command line latex (pdflatex, lualatex, etc)
brew install --cask mactex-no-gui

# install python3 and pip3 and configure
brew install python3

# install python packages
python3 -m pip install --break-system-packages --user numpy
python3 -m pip install --break-system-packages --user scipy
python3 -m pip install --break-system-packages --user matplotlib
python3 -m pip install --break-system-packages --user pandas
python3 -m pip install --break-system-packages --user cvxpy
python3 -m pip install --break-system-packages --user "jax[cpu]"
