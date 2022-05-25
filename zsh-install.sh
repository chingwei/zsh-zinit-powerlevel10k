#!/bin/bash
setup_color() {
  FMT_RED=$(printf '\033[31m')
  FMT_GREEN=$(printf '\033[32m')
  FMT_YELLOW=$(printf '\033[33m')
  FMT_BLUE=$(printf '\033[34m')
  FMT_BOLD=$(printf '\033[1m')
  FMT_RESET=$(printf '\033[0m')
}

env_init() {
    if [[ $OSTYPE == 'darwin'* ]]; then
        SED_FIX="\"\""
    else
        SED_FIX=""
    fi
}

main() {
    env_init
    setup_color

    echo -e "\n${FMT_YELLOW}(1). checking OS. \n----------------------------------------------------------------${FMT_RESET}"
    if [[ $OSTYPE == 'darwin'* ]]; then
        echo -e "\n${FMT_YELLOW} (Mac OS). checking brew. \n----------------------------------------------------------------${FMT_RESET}"
        if command -v brew &> /dev/null
        then
            echo -e "${FMT_GREEN}brew already installed.${FMT_RESET}"
        else
            echo -e "${FMT_RED}start install brew. ${FMT_RESET}"
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
    elif [[ $OSTYPE == 'linux'* ]]; then
        echo -e "${FMT_GREEN}(Linux).${FMT_RESET}"
    else
        echo -e "${FMT_RED}OS not supported, bye.${FMT_RESET}"
        exit 1
    fi

    echo -e "\n${FMT_YELLOW}(2). backup and copy .zshrc \n----------------------------------------------------------------${FMT_RESET}"
        [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
        ln -s ./.zshrc ~/.zshrc
    fi
    
    echo -e "\n${FMT_YELLOW}(3). change to zsh \n----------------------------------------------------------------${FMT_RESET}"
    if [[ $SHELL == *"zsh" ]]; then
        echo -e "${FMT_GREEN}already using zsh.${FMT_RESET}"
    else
        echo -e "${FMT_RED}start change shell to zsh. ${FMT_RESET}"
        chsh -s /bin/zsh
    fi

    echo "Please Run [ source ~/.zshrc ] to Enable."
 
    echo -e "\n${FMT_YELLOW}Congres, install finished.${FMT_RESET}"
}

main "$@"
