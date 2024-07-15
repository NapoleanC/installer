# Written by: Christopher Gholmieh
# Sources:

. ./utilities/packages.sh
. ./utilities/prompter.sh

# Functions:
paru() {
	if [ ! -d ~/AUR-Repositories ]; then
		mkdir ~/AUR-Repositories
	fi

	cd ~/AUR-Repositories

	sudo pacman -S --needed git base-devel

	git clone https://aur.archlinux.org/paru.git
	cd paru && makepkg -si

	cd
}
