# Written by: Christopher Gholmieh
# Sources:

. ./utilities/packages.sh
. ./utilities/prompter.sh

# Functions:
google() {
	if [ ! -d ~/AUR-Repositories ]; then
		mkdir ~/AUR-Repositories
	fi

	cd ~/AUR-Repositories

	sudo pacman -S --needed git base-devel

	git clone https://aur.archlinux.org/google-chrome.git
	cd google-chrome && makepkg -si

	cd
}
