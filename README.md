# WOVN Installed Environment Maker

WOVNの各ライブラリのインストール環境を作成するための `Makefile`, `docker-compose.yml` を含んでいます。
ライブラリの動作検証を想定したものになっています。なお、動作を保証するものではありません。

## 環境作成

1. 作成したい環境のディレクトリへ移動
2. `make` で環境の構築
3. `docker-compose up -d` で Docker Compose を起動

## 環境削除

1. `docker-compose down -v`
2. `make clean`

## Makefile 変数

| 変数名                       | 概要                                   | 既定値  |
|------------------------------|----------------------------------------|---------|
| WOVNPHP\_BRANCH\_NAME        | WOVN.phpのインストールバージョン       | master  |
| WOVNPHP\_HTACCESS            | サンプル .htaccess のインストール      | yes     |
| WOVNPHP\_WOVN\_INDEX         | wovn_index.phpのインストール           | yes     |
| WOVNJAVA\_VERSION            | WOVN.javaのインストールバージョン      | 1.7.2   |
| WP\_LANG\_JA                 | 日本語UIのインストール                 | yes     |
| WP\_MULTISITE                | WordPressのマルチサイト化              | yes     |
| WP\_ADMIN\_USER              | WordPress ユーザ                       | admin   |
| WP\_ADMIN\_PASS              | WordPress パスワード                   | admin   |
| WP\_INSTALL\_WOVNIO\_PLUGIN  | WordPress Pluginのインストール         | yes     |
| WP\_INSTALL\_POPULAR\_PLUGIN | WordPress 人気プラグインのインストール | yes     |

### 例

Makefileの変数は下記のように上書きを行い指定のバージョンをインストールします。

```
# Example.1
make WOVNPHP_BRANCH_NAME=1.0.0 WOVNPHP_WOVN_INDEX=no

# Example.2
make WP_LANG_JA=no WP_MULTISITE=yes WP_INSTALL_POPULAR_PLUGIN=yes
```

## Docker Compose 変数

| 変数名               | 概要                | 既定値  |
|----------------------|---------------------|---------|
| PHP\_APACHE\_VERSION | PHPバージョン       | 7.3     |
| TOMCAT\_VERSION      | Tomcatバージョン    | 8       |
| WORDPRESS\_VERSION   | Wordpressバージョン | 5       |

### 例

Docker Composeを起動する前に `.env` ファイルを作成して変数を上書きを行い指定のバージョンを起動します。

```
cat .env
PHP_APACHE_VERSION=5.6
TOMCAT_VERSION=7
WORDPRESS_VERSION=5.2.4
```

## `wovn-env-maker` コマンド

`wovn-env-maker` コマンドの定義ファイルを読み込みます、もしくは、 bash_completion.d ディレクトリへコピーしてください。

```
source shell-completion/wovn-env-maker.bash
```

```
source shell-completion/wovn-env-maker.fish
```

