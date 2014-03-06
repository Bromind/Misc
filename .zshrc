#!/bin/zsh

# completion

autoload -U compinit
compinit

# correction

setopt correctall

# prompt

autoload -U promptinit
promptinit
prompt gentoo

# history
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
setopt hist_ignore_all_dups

# auto cd
setopt autocd

# aliases
PATH=/home/martin/.bash/:${PATH}
alias ls='ls --color=always'
alias s4='cd ~/Documents/EPFL/Semestre\ IV'

# starting programs
./.bash_aliases


# personal preexec
preexec(){
  declare battery=0
  battery=`acpi -b | cut -d " " -f4 | cut -d "%" -f1`
  ac=`acpi -b | cut -d "%" -f2 | cut -d " " -f2`

  if [ "$ac" = "" ] ; then # is loading
    color="green"
    display="%B$battery%b"
  else 
    if [ $(expr $battery) -le 20 ] ; then
      color="red"
    else
      color="yellow"
    fi
     display="%B$battery%b%F{$color} [$ac]"
  fi
  RPROMPT="%F{$color}$display%f"
}
