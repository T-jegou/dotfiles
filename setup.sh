#!/usr/bin/env bash

xcode-select --install
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/tjegou/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tjegou/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo -v

brew update

brew upgrade

brew install  ack \
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
	kind \
	kubernetes-cli \
	k9s \
	lua \
	make \
	powerlevel10k \
	vim \
	openssh \
	protobuf \
	python \
	redis \
	terraform \
	tree \
	wireshark \
	wget \
	yq \
	zoxide \
	zsh-autosuggestions \
	zsh-syntax-highlighting

brew install --cask cmake \
	docker \
	google-chrome \
	wezterm \
	spotify \
	slack \
	transmission \
	whatsapp \
	vscodium

brew cleanup

# Switch to using brew-installed zsh as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
	echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
	chsh -s /usr/local/bin/zsh;
fi;

for file in ./.{aliases,curlrc,exports,functions,gitconfig,p10k.zsh,paths,wgetrc,wezterm.lua,zshrc}; do
	cp -v "$file" ~;
done;
unset file;

cp -R .zsh ~



pip3 install --upgrade pip
pip3 install -r requirements.txt

go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install golang.org/x/perf/cmd/benchstat@latest
go install golang.org/x/tools/cmd/stress@latest
go install sigs.k8s.io/kubetest2/...@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/praetorian-inc/gokart@latest
go install github.com/securego/gosec/v2/cmd/gosec@latest
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
go install github.com/google/osv-scanner/cmd/osv-scanner@v1

./.macos

sudo reboot
