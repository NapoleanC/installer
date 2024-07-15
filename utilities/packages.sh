# Written by: Christopher Gholmieh
# Functions:
function is_installed() {
	if pacman -Qs "^$1$" >/dev/null 2>&1; then
		echo "1"
	else
		echo "0"
	fi
}
