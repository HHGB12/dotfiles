ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
# ZSH_THEME="robbyrussell"


# *******************************************
# *   powerlevel9k
# *******************************************

# *******************************************
# *  link
# *
# * |── Medium
# * │   ├── main  # https://is.gd/jUiIc2 or (1) local
# * │   ├── other # https://is.gd/d4XTqB or (2)
# * │   └── ...             # etc.
# * |── Powelevel
# * │   ├── github   # https://is.gd/GNOM6P
# * │   ├── Example  # https://is.gd/5LILBI
# * │   ├── Install  # https://is.gd/Kyb72a
# * │   └──
# * |── nerd-fonts
# * │   ├── github   # https://is.gd/qbgSWN
# * │   ├── font     # https://is.gd/0GjARk
# * │   ├── Install  # https://is.gd/Kyb72a
# * │   └──
# * |── other
# * │   ├── codcamp  # https://is.gd/75dYXN
# * │   ├── Example  # https://is.gd/5LILBI
# * │   ├── Install  # https://is.gd/Kyb72a
# * │   └──
# * |── color
# * │   ├── medium  # https://is.gd/D33AIw (3)
# * │   ├── github  # https://is.gd/htMB7c
# * │   ├── Install  # https://is.gd/Kyb72a
# * │   └──
# *******************************************


ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_MODE="Hack"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="black"


zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{black}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{black}'

                [[ $speed -gt 100 ]] && color='%F{black}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$speed Mbps \uf1eb%{%f%}" # removed char not in my PowerLine font
        fi
}
prompt_rbenvironment() {
  if [ $commands[rvm-prompt] ]; then
    local version_and_gemset=${$(rvm-prompt)/ruby-}

    if [[ -n "$version_and_gemset" ]]; then
      "$1_prompt_segment" "$0" "$2" "240" "$DEFAULT_COLOR" "$version_and_gemset" 'RUBY_ICON'
    fi
  fi
}

POWERLEVEL9K_RBENVIRONMENT='prompt_rbenvironment'

# https://github.com/bhilburn/powerlevel9k/issues/1282#issue-447222651
POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=true
POWERLEVEL9K_CONTEXT_TEMPLATE='@me'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_toto custom_tata dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(battery status time dir_writable ip custom_wifi_signal ram load background_jobs node_version)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram  dir_writable battery swift_version rbenv node_version )
POWERLEVEL9K_CHRUBY_SHOW_ENGINE=true
POWERLEVEL9K_CHRUBY_SHOW_VERSION=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_RAM_BACKGROUND='yellow'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

POWERLEVEL9K_CUSTOM_TOTO="echo -n '\uF859'"
POWERLEVEL9K_CUSTOM_TOTO_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_TOTO_BACKGROUND="white"

POWERLEVEL9K_CUSTOM_TATA="echo -n '\uE242 Vbaxt'"
POWERLEVEL9K_CUSTOM_TATA_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_TATA_BACKGROUND="cyan"

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{white}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{white}\u2570\uf460%f "


# *******************************************
# *   END of powerlevel9k
# *******************************************


# Useful plugins for Rails development with Sublime Text
plugins=(gitfast dnf last-working-dir common-aliases sublime zsh-syntax-highlighting zsh-autosuggestions history-substring-search)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $(dirname $(gem which colorls))/tab_complete.sh
