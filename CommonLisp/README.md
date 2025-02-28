# CommonLisp

## MacOS

macOSでCommonLispの環境を構築するためのシェルスクリプト。

以下の環境を想定している。

- Homebrewインストール済み
- VScodeで動かす

### CommonLispの環境を構築

シェルスクリプトを実行してください。

```sh
bash lisp-setup.sh
```

以下の環境が構築されます。

- Roswell
- Quicklisp
- SBCL
- SLIME

また、VScode拡張機能のAliveで必須のライブラリもインストールしています。
- usocket
- bordeaux-threads
- cl-json
- flexi-streams

### VScode拡張機能のインストール

その後、VScode拡張機能のAliveをインストールしてください。

https://github.com/nobody-famous/alive

シンタックスハイライト用に、以下の拡張機能もいれるとよいでしょう。

https://github.com/qingpeng9802/vscode-common-lisp


