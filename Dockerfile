# Pythonベースイメージ
FROM python:3.11

# 作業ディレクトリ設定
WORKDIR /app

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/*

# 必要ライブラリのインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ポート開放
EXPOSE 8000

# コンテナ起動時のコマンド
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "django_013_lingo.wsgi:application"]
