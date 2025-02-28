#!/bin/sh

set -e  # コマンドが失敗したら即時終了

log_and_exit() {
    echo "エラー: $1 で失敗しました。" >&2
    exit 1
}

echo "Homebrew で Roswell をインストール中..."
brew install roswell || log_and_exit "brew install roswell"

echo "Roswell のセットアップ中..."
ros setup || log_and_exit "ros setup"

echo "Quicklisp のインストールスクリプトをダウンロード中..."
curl -O https://beta.quicklisp.org/quicklisp.lisp || log_and_exit "curl -O quicklisp.lisp"

echo "SBCL に Quicklisp をインストール中..."
sbcl --non-interactive --load quicklisp.lisp --eval "(quicklisp-quickstart:install)" --eval "(ql:add-to-init-file)" || log_and_exit "SBCL Quicklisp インストール"

echo "Quicklisp のロード確認中..."
sbcl --non-interactive --eval "(ql:quickload :quicklisp)" || log_and_exit "ql:quickload :quicklisp"

echo "SLIME ヘルパーをインストール中..."
sbcl --non-interactive --eval "(ql:quickload :quicklisp-slime-helper)" || log_and_exit "ql:quickload :quicklisp-slime-helper"

echo "usocket をインストール中..."
sbcl --non-interactive --eval "(ql:quickload :usocket)" || log_and_exit "ql:quickload :usocket"

echo "bordeaux-threads をインストール中..."
sbcl --non-interactive --eval "(ql:quickload :bordeaux-threads)" || log_and_exit "ql:quickload :bordeaux-threads"

echo "cl-json をインストール中..."
sbcl --non-interactive --eval "(ql:quickload :cl-json)" || log_and_exit "ql:quickload :cl-json"

echo "flexi-streams をインストール中..."
sbcl --non-interactive --eval "(ql:quickload :flexi-streams)" || log_and_exit "ql:quickload :flexi-streams"

echo "すべてのインストールが完了しました！"

echo "VScodeで以下の拡張機能をインストールしてください。"
echo "- Alive by Rich Heller"
echo "- Common Lisp by Qingpeng Li"
