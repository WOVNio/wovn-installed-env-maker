#!/usr/bin/env zsh

wovn-env-maker() {
  local target=$1
  curl -fLSs https://github.com/WOVNio/wovn-installed-env-maker/archive/master.zip -o maker.zip
  unzip maker.zip ${(f)"$(zipinfo -1 maker.zip | grep -E "wovn-installed-env-maker-master/(?:common|$target)/")"}

  rm -f maker.zip
  mv wovn-installed-env-maker-master/* .
  rm -rf wovn-installed-env-maker-master
}

_wovn-env-maker() {
  # 第1引数のときだけ補完
  (( CURRENT == 2 )) || return 1

  # 初回だけ GitHub API からディレクトリ一覧を取得してキャッシュ
  if (( ${#__complete_wovn_env_maker_arguments_names} == 0 )); then
    typeset -ga __complete_wovn_env_maker_arguments_names
    __complete_wovn_env_maker_arguments_names=(
      ${(f)"$(curl -Ss 'https://api.github.com/repos/WOVNio/wovn-installed-env-maker/contents/?ref=master' \
        | jq -r '.[]|select(.type == "dir")|.path')"}
    )
  fi

  compadd -a __complete_wovn_env_maker_arguments_names
}

# compinit が未ロードなら読み込む
(( $+functions[compdef] )) || { autoload -Uz compinit && compinit }
compdef _wovn-env-maker wovn-env-maker
