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
abbr vim 'nvim'
abbr python "python3"
abbr C 'clear'
abbr c "clear"
abbr fn "rm -rf ~/.local/share/nvim/swap"
abbr s 'ls'
abbr ll 'ls'
abbr l 'ls'
abbr v 'nvim'
abbr vi 'nvim'
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
abbr 'frc' 'nvim ~/.config/fish/config.fish'
abbr 'vrc' 'nvim ~/.config/nvim/init.vim'
abbr pip 'pip3'
abbr t 'nvim -c ":VimwikiIndex"'
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
  nvim $argv
end
funcsave tv

function updateDotsGit
  rsync -rv --exclude=.git ~/.config/nvim ~/Dotfiles/.config/
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

set PATH /Users/sam/flutter/bin $PATH

set -U fish_user_paths /Users/sam/.node_modules/bin $fish_user_paths
set -x GOPATH /users/sam/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

set -g posh_theme /Users/sam/theme.json
set -g POWERLINE_COMMAND "oh-my-posh"
set -g CONDA_PROMPT_MODIFIER false

function fish_prompt
    set -l omp_stack_count (count $dirstack)
    set -l omp_duration "$CMD_DURATION$cmd_duration"
    # check if variable set, < 3.2 case
    if set -q omp_lastcommand; and test "$omp_lastcommand" = ""
      set omp_duration 0
    end
    # works with fish >=3.2
    if set -q omp_last_status_generation; and test "$omp_last_status_generation" = "$status_generation"
      set omp_duration 0
    end
    if set -q status_generation
      set -gx omp_last_status_generation $status_generation
    end

    /usr/local/bin/oh-my-posh --config $posh_theme --error $status --execution-time $omp_duration --stack-count $omp_stack_count
end

function postexec_omp --on-event fish_postexec
  # works with fish <3.2
  # pre and postexec not fired for empty command in fish >=3.2
  set -gx omp_lastcommand $argv
end


function export_poshconfig
  set -l file_name $argv[1]
  set -l format $argv[2]
  if not test -n "$file_name"
    echo "Usage: export_poshconfig \"filename\""
    return
  end
  if not test -n "$format"
    set format "json"
  end
  /usr/local/bin/oh-my-posh --config $posh_theme --print-config --config-format $format > $file_name
end
