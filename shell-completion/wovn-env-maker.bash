#!/usr/bin/env bash

function wovn-env-maker {
    argv=$1
    curl -L -S https://github.com/iwai-wovn/wovn-installed-env-maker/archive/master.zip -o maker.zip
    unzip maker.zip `zipinfo -1 maker.zip | grep -E "wovn-installed-env-maker-master/(?:common|$argv)/"`
    rm -f maker.zip
    mv wovn-installed-env-maker-master/* .
    rm -rf wovn-installed-env-maker-master
}
function __complete_wovn-env-maker_arguments {
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
        return
    fi

    if [ ! -n "$__complete_wovn_env_maker_arguments_names" ]; then
        __complete_wovn_env_maker_arguments_names=`curl -Ss 'https://api.github.com/repos/iwai-wovn/wovn-installed-env-maker/contents/?ref=master' | jq -r '.[]|select(.type == "dir")|.path'`
    fi

    COMPREPLY=($(compgen -W "$__complete_wovn_env_maker_arguments_names" -- "${COMP_WORDS[1]}"))
    #COMPREPLY=($(compgen -W "$(fc -l -50 | sed 's/\t//')" -- "${COMP_WORDS[1]}"))
}
complete -F __complete_wovn-env-maker_arguments wovn-env-maker
