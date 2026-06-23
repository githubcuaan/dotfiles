valley() {
  /home/andev/.config/caelestia/scripts/valley.sh
}

gocr() {
    if [[ $# -eq 0 ]]; then
        echo -e "\e[31m You need to add .cpp argm (ex: gocr main.cpp).\e[0m"
        return 1
    fi

    local out="${1%.*}"

    echo -e "\e[34m󰄵  Compiling...\e[0m"
    if g++ -Wall -O2 "$@" -o "$out"; then
        echo -e "\e[32m󰐊  Running...\e[0m\n"
        ./"$out"
    else
        echo -e "\e[31m  Error when compiling.\e[0m"
        return 1
    fi

    rm -f "$out"
}

y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
