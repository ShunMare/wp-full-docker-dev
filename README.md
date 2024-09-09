# wp-full-docker-dev

このプロジェクトは、WordPressの全ファイルをDocker環境にマウントし、完全な開発環境を提供するためのテンプレートです。

## 前提条件

- [Git for Windows](https://gitforwindows.org/)
- [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop)

## セットアップ手順

1. **リポジトリのクローン**

   ```bash
   git clone https://github.com/ShunMare/wp-full-docker-dev.git
   cd wp-full-docker-dev
   ```

2. **環境変数の設定**
   - `.env.example` ファイルをコピーして `.env` という名前で保存します。
   - `.env` ファイルを編集し、必要に応じて変数を設定します：

     ```bash
     PROJECT_NAME=your-project-name
     WORDPRESS_DB_HOST=db
     DB_NAME=wordpressdb
     DB_USER=wordpressuser
     DB_PASSWORD=wordpresspass
     ```

3. **WordPressファイルのセットアップ**
   - Windowsの場合：`setup.bat` を実行します。
   - Mac/Linuxの場合：`./setup.sh` を実行します。

4. **Dockerコンテナの起動**

   ```bash
   docker-compose up -d
   ```

5. **WordPressのインストール**
   - ブラウザで `http://localhost:8000` にアクセスします。
   - 画面の指示に従ってWordPressのインストールを完了します。

## プロジェクト構造

```bash
wp-full-docker-dev/
│
├── wordpress/                  # WordPressのルートディレクトリ
│   ├── wp-admin/
│   ├── wp-content/
│   │   ├── themes/
│   │   ├── plugins/
│   │   └── uploads/
│   ├── wp-includes/
│   └── ...
│
├── docker-compose.yml
├── dockerfile-wordpress
├── .env
├── setup.sh (または setup.bat)
└── README.md
```

## 開発ワークフロー

1. **テーマ開発**
   - `wordpress/wp-content/themes/your-theme/` ディレクトリでテーマを開発します。

2. **プラグイン開発**
   - `wordpress/wp-content/plugins/` ディレクトリでプラグインを開発します。

3. **WordPressコアファイルへのアクセス**
   - 必要に応じて `wordpress/` ディレクトリ内のファイルにアクセスできます。
   - 注意：コアファイルの変更は推奨されません。

## データベースへのアクセス

- **ホスト**: `localhost`
- **ポート**: 3306
- **データベース名**: `.env` ファイルの `DB_NAME` と同じ
- **ユーザー名**: `.env` ファイルの `DB_USER` と同じ
- **パスワード**: `.env` ファイルの `DB_PASSWORD` と同じ

## トラブルシューティング

問題が発生した場合：

1. Dockerコンテナを再起動します：

   ```bash
   docker-compose down
   docker-compose up -d
   ```

2. WordPressファイルを再度ダウンロードします：
   - `wordpress` ディレクトリを削除し、`setup.bat`（または`setup.sh`）を再実行します。

3. Docker Desktopの「Containers」タブでログを確認します。

## 注意事項

- このセットアップでは、WordPressの全ファイルがホストマシンにマウントされます。
- コアファイルの変更は慎重に行ってください。
- 本番環境へのデプロイ時は、開発中に行った変更に注意してください。
