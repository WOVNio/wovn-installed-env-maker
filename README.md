# WOVN Installed Environment Maker

    WOVNの各ライブラリのインストール環境を作成するための Makefile, Docker を含んでいます。
    ライブラリの動作検証を想定したものになっています。なお、動作を保証するものではありません。

## 環境作成

1. 作成したいライブラリのディレクトリへ移動
2. `make` でライブラリのインストール
3. `docker-compose up -d` で Docker Compose を起動
4. http://127.0.0.1:4040 Ngrokへアクセス
5. NgrokのURLをWOVN.ioへプロジェクトの登録 URL例: `http://xxxxxxxxxxxx.ngrok.io`
6. 発行されたプロジェクトトークンを `wovn.ini` 等へ設定

## 環境削除

1. `docker-compose down -v`
2. `make clean`

## Makefile 変数

| 変数名                    | 概要                                   | 既定値  |
|---------------------------|----------------------------------------|---------|
| WOVNPHP_BRANCH_NAME       | WOVN.phpのインストールバージョン       | master  |
| WOVNPHP_HTACCESS          | サンプル .htaccess のインストール      | yes     |
| WOVNPHP_WOVN_INDEX        | wovn_index.phpのインストール           | yes     |
| WOVNJAVA_VERSION          | WOVN.javaのインストールバージョン      | 1.2.0   |
| WP_LANG_JA                | 日本語UIのインストール                 | yes     |
| WP_MULTISITE              | WordPressのマルチサイト化              | yes     |
| WP_ADMIN_USER             | WordPress ユーザ                       | admin   |
| WP_ADMIN_PASS             | WordPress パスワード                   | admin   |
| WP_INSTALL_WOVNIO_PLUGIN  | WordPress Pluginのインストール         | yes     |
| WP_INSTALL_POPULAR_PLUGIN | WordPress 人気プラグインのインストール | yes     |

### 例

    Makefileの変数は下記のように上書きを行い指定のバージョンをインストールします。

```
make WOVNPHP_BRANCH_NAME=1.0.0 WOVNPHP_WOVN_INDEX=no
make WP_LANG_JA=no WP_MULTISITE=yes WP_INSTALL_POPULAR_PLUGIN=yes
```

## Docker Compose 変数

| 変数名             | 概要                | 既定値  |
|--------------------|---------------------|---------|
| PHP_APACHE_VERSION | PHPバージョン       | 7.3     |
| TOMCAT_VERSION     | Tomcatバージョン    | 8       |
| WORDPRESS_VERSION  | Wordpressバージョン | 5       |

### 例

    Docker Composeを起動する前に `.env` ファイルを作成して変数を上書きを行い指定のバージョンを起動します。

```
cat .env
PHP_APACHE_VERSION=5.6
TOMCAT_VERSION=7
WORDPRESS_VERSION=5.2.4
```

