#!/usr/bin/env bash

# ---- Xcode Command Line Tools Installation ----
# Install Xcode command line tools and set the developer directory
xcode-select --install
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

# ---- Install Homebrew ----
# Download and install Homebrew package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# ---- Configure Homebrew Environment ----
# Add Homebrew to the shell profile for PATH integration
echo >> /Users/tjegou/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tjegou/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---- Install Oh My Zsh ----
# Install the Oh My Zsh framework for managing Zsh configuration
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ---- Update sudo session ----
sudo -v

# ---- Update and Upgrade Homebrew Packages ----
brew update
brew upgrade

# ---- Install Command-Line Tools via Homebrew ----
# Essential CLI tools and utilities
brew install ack \
	bash \
	bash-completion \
	bat \
	ca-certificates \
	coreutils \
	curl \
	eza \
	font-meslo-lg-nerd-font \
	git \
	git-delta \
	git-extras \
	git-lfs \
	go \
	grep \
	grpcurl \
	gpg \
	helm \
	htop \
	jq \
	k9s \
	kind \
	kubernetes-cli \
	lua \
	make \
	open-ssh \
	powerlevel10k \
	protobuf \
	python \
	redis \
	terraform \
	tree \
	vim \
	wireshark \
	wget \
	yq \
	zoxide \
	zsh-autosuggestions \
	zsh-syntax-highlighting

# ---- Install Applications via Homebrew Cask ----
# GUI applications
brew install --cask \
	cmake \
	docker \
	google-chrome \
	slack \
	spotify \
	tailscale \
	transmission \
	vscodium \
	wezterm \
	whatsapp

# ---- Cleanup Homebrew Cache ----
brew cleanup

# ---- Set Zsh Installed by Brew as Default Shell ----
# Check and add to shells if missing, then set as default
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
	echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
	chsh -s /usr/local/bin/zsh
fi

# ---- Copy Configuration Files to Home Directory ----
# Copy various config files (.aliases, .curlrc, etc.) to home directory
for file in ./.{aliases,curlrc,exports,functions,gitconfig,p10k.zsh,paths,wgetrc,wezterm.lua,zshrc}; do
	cp -v "$file" ~
done
unset file

# Copy .zsh folder
cp -R .zsh ~

# ---- Python Package Installation ----
# Upgrade pip and install packages from requirements.txt
pip3 install --upgrade pip
pip3 install -r requirements.txt

# ---- Install Go Tools ----
# Various Go tools for development and security scanning
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install golang.org/x/perf/cmd/benchstat@latest
go install golang.org/x/tools/cmd/stress@latest
go install sigs.k8s.io/kubetest2/...@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/praetorian-inc/gokart@latest
go install github.com/securego/gosec/v2/cmd/gosec@latest
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
go install github.com/google/osv-scanner/cmd/osv-scanner@v1

# ---- macOS System Configuration ----
# Run macOS-specific configuration script
./.macos

# ---- Reboot System ----
sudo reboot
