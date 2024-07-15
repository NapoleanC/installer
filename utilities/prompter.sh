# Written by: Christopher Gholmieh
# Functions:
function prompt_user() {
    read -p "$1" response

    if [[ "${response//[[:space:]]/}" == "y" || "${response//[[:space:]]/}" == "yes" ]]; then
        echo "1"
    elif [[ "${response//[[:space:]]/}" == "n" || "${response//[[:space:]]/}" == "no" ]]; then
        echo "0"
    fi
}
