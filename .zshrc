# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 歷史命令日期顯示格式
HIST_STAMPS="yyyy-mm-dd"

# 設定 Color, ls 會顏色
export CLICOLOR=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 下面都是zinit配置
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# 載入 powerlevel10k 主題
zinit ice depth=1; zinit light romkatv/powerlevel10k

# 載入外掛
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
#zinit light marlonrichert/zsh-autocomplete # 強大，但在找歷史指令時，會把zsh-history-substring-search 的功能蓋掉
zinit light zsh-users/zsh-history-substring-search

# 綁定 zsh-history-substring-search 上下鍵
# bindkey -M emacs '^[[A' history-substring-search-up
# bindkey -M emacs '^[[B' history-substring-search-down

# 載入 OMZ 框架及部分外掛 (不知道用在那，先Mark 掉)
# zinit snippet OMZ::lib/key-bindings.zsh
# zinit snippet OMZ::lib/completion.zsh
# zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/history.zsh
# zinit snippet OMZ::lib/theme-and-appearance.zsh
# zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
# zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

zinit ice lucid wait='0'
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice lucid wait='0'
zinit snippet OMZ::lib/git.zsh

# public alias
alias port='netstat tln '
alias size="du --max-depth=1 -B M | sort -g"
alias l='ls -alh'
alias grepn='grep -nrE ./'
alias findn='find ./ -name'
alias v.z='vim ~/.zshrc'
alias s.z='source ~/.zshrc'
alias ..='cd ../'
alias tree="tree -alI 'node_modules|.git'"


# private alias
alias tt="sh ~/.ssh/tt.sh"
alias tc="sh ~/.ssh/tc.sh"
alias ptt="ssh bbsu@ptt.cc"
alias code="cd ~/Documents/project"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
