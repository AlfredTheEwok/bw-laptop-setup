#!/bin/bash

# install xcode
xcode-select --install
# agree to xcode license
sudo xcodebuild -license accept

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install some apps from brew
brew cask install google-chrome
brew cask install firefoxdeveloperedition
brew cask install alfred
brew cash install skitch
brew cask install slack

# install dev related stuff from brew
brew cask install pgadmin4
brew cask install sublime-text
brew install neovim
brew install node
brew install python
brew cask install
# brew install go --cross-compile-common # install golang w/ compiling cross os/architectures
brew install heroku-toolbelt
brew cask install iterm2
brew install zsh
brew install direnv
brew install postgresql # TODO: verify this functions and doesnt need any additional setup
brew install the_silver_searcher
brew install httpie

# python packages
pip install ipython django flake8 virtualenvwrapper cdiff haste-client

# zsh plugins
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew services start postgresql

# git setup
git config --global user.email "alfred@betterworks.com"
git config --global user.name "AlfredTheEwok"
git config --global core.editor "subl -n -w"

# font setup
brew tap caskroom/fonts
brew cask install font-fira-code

# iterm color setup
curl "https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors" > ~/Downloads/OneDark.itermcolors

# TODO: look into https://gist.github.com/brandonb927/3195465 and related for more tweaks

echo "Post installation tips:"
echo "- Set fira-code font in iterm2"
echo "- Set itermcolor scheme (file is OneDark.itermcolors)"