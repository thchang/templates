# Update apt lists
apt update

# Common user utilities
apt install evince

# Install remote access tools
apt install mpich
apt install openssh-client
apt install tmux

# Install developer tools
apt install vim
apt install gfortran
apt install poppler-utils
apt install python3-pip
apt install cmake
apt install git
apt install linux-tools-common
apt install linux-tools-generic

# Install Python packages
python3 -m pip install --user -r PYTHON_REQUIREMENTS

# Install LaTeX
apt install tex-common
apt isntall texlive-base
apt install texlive-full
apt install texlive-fonts-extra
apt install texlive-luatex
