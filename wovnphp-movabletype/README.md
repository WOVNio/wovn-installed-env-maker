# MovableType

## 環境作成

1. `make` で環境の構築
2. `docker-compose up -d` でサービスの起動
3. http://127.0.0.1:8080/cgi-bin/mt/mt.cgi?__mode=rebuild_confirm&blog_id=1 にアクセスしてサイトの再構築
4. http://127.0.0.1:4040 Ngrokへアクセス
5. NgrokのURLをWOVN.ioへプロジェクトの登録 URL例: `http://xxxxxxxxxxxx.ngrok.io`
6. 発行されたプロジェクトトークンを `wovn.ini` へ設定

| 項目                  | 概要                              |
| --------------------- | --------------------------------- |
| MovableType Dashboard | http://127.0.0.1:8080/cgi-bin/mt/ |
| Login ID              | admin                             |
| Login Password        | password                          |



