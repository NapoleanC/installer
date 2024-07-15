# Written by: Christopher Gholmieh
# Sources:

. ./utilities/prompter.sh

. ./modules/paru.sh
. ./modules/google.sh

# Functions:
function main() {
	if [[ "$EUID" == "0" ]]; then
		echo "[-] Please do not run this script as root."

		exit
	fi

	sudo pacman -Syyu

	if [[ $(prompt_user "[*] Would you like to install paru? [y/N]: ") == "1" ]]; then
		paru
	fi

	if [[ $(prompt_user "[*] Would you like to install google-chrome? [y/N]: ") == "1" ]]; then
		google
	fi

	if [[ $(prompt_user "[*] Would you like to install alacritty? [y/N]: ") == "1" ]]; then
		sudo pacman -S alacritty
	fi

	if [[ $(prompt_user "[*] Would you like to install some nerd fonts and icons? [y/N]: ") == "1" ]]; then
		sudo pacman -S ttf-jetbrains-mono-nerd
		paru -S ttf-material-icons-git
	fi

	if [[ $(prompt_user "[*] Would you like to clone appropriate dotfiles? [y/N]: ") == "1" ]]; then
		mkdir ~/Downloads
		git clone https://github.com/NapoleanC/dotfiles ~/Downloads
		mv ~/Downloads/dotfiles/* ~/.config/

		sudo pacman -S --needed xorg xorg-xinit bspwm polybar picom sxhkd rofi dunst fish neofetch

		sudo pacman -S lua-language-server clang bash-language-server

		cp /etc/X11/xinit/xinitrc ~/.xinitrc
		printf "Please add in the .xinitrc: xsetroot -cursor_name left_ptr\nexec bspwm."

		sudo pacman -S pavucontrol pipewire pipewire-pulse
		sudo pacman -S lxappearance qt5ct brightnessctl

		sudo echo "QT_QPA_PLATFORMTHEME=\"qt5ct\"" | sudo tee -a /etc/environment

		mkdir -p ~/.config/qt5ct/colors/
		git clone https://github.com/catppuccin/qt5ct ~/Downloads

		mv ~/Downloads/qt5ct/* ~/.config/qt5ct/colors/

		paru -S colloid-nord-gtk-theme-git
	fi

	echo "[*] The installer is done!"
}

# Main:
main
