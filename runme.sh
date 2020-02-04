#!/bin/bash -x
rbenv_install=$(curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash)
echo $rbenv_install
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
eval "exec $SHELL"
eval "$(cat ~/.bashrc | tail -n +14)"
echo "########install rbenv version############"
eval "rbenv install 2.7.0"
if [ $? -eq 0 ]; then
    eval "rbenv global 2.7.0"
    if [ $? -eq 0 ]; then
	echo "#####installation was successful####"
    fi
else
    echo "run sudo zypper in libopenssl-devel and try again"
fi
eval "rbenv global 2.6.5"
gem install bundler
./bin/setup
