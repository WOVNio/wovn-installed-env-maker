#!/usr/bin/env fish

function wovn-env-maker -d 'Generate wovn environment template'
    curl -L -S https://github.com/iwai-wovn/wovn-installed-env-maker/archive/master.zip -o maker.zip
    unzip maker.zip (zipinfo -1 maker.zip | grep -E "wovn-installed-env-maker-master/(?:common|$argv)/")
    rm -f maker.zip
    mv wovn-installed-env-maker-master/* .
    rm -rf wovn-installed-env-maker-master
end
function __complete_wovn-env-maker_arguments
    set -q __complete_wovn_env_maker_arguments_names
    and echo -n $__complete_wovn_env_maker_arguments_names
    and return 1

    set -g __complete_wovn_env_maker_arguments_names ( \
    curl -Ss 'https://api.github.com/repos/iwai-wovn/wovn-installed-env-maker/contents/?ref=master' \
    | jq -r '.[]|select(.type == "dir")|.path'
    )
    echo -n $__complete_wovn_env_maker_arguments_names
end
complete -c wovn-env-maker -x -a '(string split " " (__complete_wovn-env-maker_arguments (commandline -ct)))' --description 'UseCase'
