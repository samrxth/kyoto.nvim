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
abbr 'ls' 'logo-ls -1 -A -D'
abbr 'frc' 'vim ~/.config/fish/config.fish'
abbr 'vrc' 'vim ~/.vimrc'
abbr pip 'pip3'
abbr t 'vim -c ":VimwikiIndex"'
abbr gv 'open /Applications/goneovim.app'
alias flutter './~/'


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
  cp ~/.vimrc ~/Dotfiles/.config/nvim/init.vim
  cp ~/.config/fish/config.fish ~/Dotfiles/.config/fish/config.fish
  cp ~/.config/goneovim/settings.toml ~/Dotfiles/.config/goneovim/settings.toml
end
funcsave updateDotsGit

function pull
  git pull
end
funcsave pull
# i suggest running one of the following commands after installing fish
# omf install bobthefish
# OR
# omf install sashimi
fish_vi_key_bindings
