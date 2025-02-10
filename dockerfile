# ベースイメージとして公式のPythonイメージを使用
FROM python:3

# 作業ディレクトリを設定
RUN mkdir /app
WORKDIR /app

# 必要なライブラリをインストールするためのrequirements.txtをコピー
COPY requirements.txt /app/

# ライブラリのインストール
RUN apt-get update && apt-get install -y \
  libpq-dev \
  && pip install --upgrade pip \
  && pip install -r requirements.txt

# プロジェクトファイルをコンテナにコピー
COPY . .

# ポート8000を開放
EXPOSE 8000

# Django開発サーバーを起動
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
