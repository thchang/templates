# Update apt lists
apt update

# Common user utilities
apt install evince

# Install remote access tools
apt install openssh-client

# Install developer tools
apt install vim
apt install gfortran
apt install python3-pip
apt install cmake
apt install git

# Install Python packages
python3 -m pip install --user numpy
python3 -m pip install --user scipy
python3 -m pip install --user matplotlib
python3 -m pip install --user pandas
python3 -m pip install --user cvxpy
python3 -m pip install --user "jax[cpu]"
python3 -m pip install --user pyyaml

# Install LaTeX
apt install tex-common
apt isntall texlive-base
apt install texlive-full
apt install texlive-fonts-extra
apt install texlive-luatex
