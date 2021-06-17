#
#██████████████████████████████████████████████████████████████████████████
#█▄─▀█▀─▄█▄─█─▄███▄─▄▄─█▄─▄█─▄▄▄▄█─█─███─▄▄▄─█─▄▄─█▄─▀█▄─▄█▄─▄▄─█▄─▄█─▄▄▄▄█
#██─█▄█─███▄─▄█████─▄████─██▄▄▄▄─█─▄─███─███▀█─██─██─█▄▀─███─▄████─██─██▄─█
#▀▄▄▄▀▄▄▄▀▀▄▄▄▀▀▀▀▄▄▄▀▀▀▄▄▄▀▄▄▄▄▄▀▄▀▄▀▀▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▀▀▄▄▀▄▄▄▀▀▀▄▄▄▀▄▄▄▄▄▀
#
#
#──────────────╔╗╔╗─╔═══╦═══╦═══╦═══╗
#─────────────╔╝╚╣║─║╔═╗║╔═╗║╔═╗║╔═╗║
#╔══╦══╦╗╔╦═╦═╩╗╔╣╚═╬╝╔╝║║║║║║║║╠╝╔╝║
#║══╣╔╗║╚╝║╔╣╔╗║║║╔╗╠═╝╔╣║║║║║║║║─║╔╝
#╠══║╔╗║║║║║║╔╗║╚╣║║║║╚═╣╚═╝║╚═╝║─║║
#╚══╩╝╚╩╩╩╩╝╚╝╚╩═╩╝╚╩═══╩═══╩═══╝─╚╝

alias emmet-ls 'npx emmet-ls'
alias nvim "./../../../../../../../../../../../../Users/sam/nvim/bin/nvim"
alias vim "./../../../../../../../../../../../../Users/sam/nvim/bin/nvim"
abbr python "python3"
abbr c "clear"
abbr fn "rm -rf ~/.local/share/nvim/swap"
abbr ll 'ls'
abbr l 'ls'
abbr v 'vim'
abbr g 'git'
abbr gb 'git branch'
abbr ga 'git add'
abbr gs 'git status -s'
abbr gco 'git checkout'
abbr gcm 'git commit'
abbr gca 'git commit -am'
abbr gd 'git diff'
abbr gp 'git push'
abbr gpf 'git push --force-with-lease'
abbr gl 'git pull'
abbr glf 'git pull --tags --force --prune --prune-tags'
abbr gf 'git fetch --tags --force --prune --prune-tags'
abbr gpr 'git pull-request'
abbr glg 'git log'
abbr gsw 'git switch'
abbr gsb 'git switch (git base)'
abbr gsm 'git switch master'
abbr gsp 'git switch -'
abbr gc 'git clone'
abbr '....' '../../..'
abbr '.....' '../../../..'
abbr '......' '../../../../..'
abbr 'ls' 'exa -1 -F -a -B'
abbr 'frc' 'vim ~/.config/fish/config.fish'
abbr 'vrc' 'vim ~/.config/nvim/init.vim'
abbr pip 'pip3'
abbr t 'vim -c ":VimwikiIndex"'
abbr gv '/Applications/goneovim.app/Contents/MacOS/goneovim'

function push
    git add .
    git commit -m $argv
    git push
end
funcsave push


function fish_greeting
end
funcsave fish_greeting

function mkcd
  mkdir $argv
  cd $argv
end
funcsave mkcd

function tv
  touch $argv
  vim $argv
end
funcsave tv

function updateDotsGit
  cp -R ~/.config/nvim ~/Dotfiles/.config/nvim/
  cp ~/.config/fish/config.fish ~/Dotfiles/.config/fish/config.fish
  cp ~/.config/goneovim/settings.toml ~/Dotfiles/.config/goneovim/settings.toml
end
funcsave updateDotsGit

function fish_mode_prompt
switch $fish_bind_mode
case default
set_color --bold red
echo 'N'
case insert
set_color --bold green
echo 'I'
case replace_one
set_color --bold green
echo 'R'
case visual
set_color --bold brmagenta
echo 'V'
case '*'
set_color --bold red
echo '?'
end
set_color normal
end

function pull
  git pull
end
funcsave pull
# i suggest running one of the following commands after installing fish
# omf install bobthefish
# OR
# omf install sashimi
fish_vi_key_bindings

set PATH /Users/sam/flutter/bin $PATH

set -x GOPATH /users/sam/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
