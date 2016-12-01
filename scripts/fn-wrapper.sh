#!/usr/bin/env bash

export u_id=$(id -u)
export g_id=$(id -g)

action=$1

run_ctl (){
  docker run -it --rm -u $u_id:$g_id -w /fn -v ${PWD}:/fn suizman/fn $@
}

install_ctl (){
  sudo cp scripts/fn-wrapper.sh /usr/local/bin/fn
} 

if [[ "$action" == install ]];
then
  echo "Installing fn into /usr/local/bin/fn"
  install_ctl
else
  run_ctl
fi
