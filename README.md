# VSCode-ja-docker
[Visual Source Code](https://code.visualstudio.com/)のコンテナです。X Windowのプロトコルをトンネルで転送して表示させます。
日本語入力として[mozc](https://github.com/google/mozc)と[uim](https://code.google.com/p/uim/)、ブラウザとして[firefox](https://www.mozilla.org/firefox/)を組み込んでいます。

## build
普通にbuildします。  
docker-machineを使っているのであれば、`docker-machine ssh xxx`してからbuildしなくとも

	% docker `docker-machine config xxx` build -t vscode .
とすればOK。

## start
コンテナを起動してssh -XでログインしてDISPLAYをhostに向けて…というのをいちいちやるのは面倒なので、

	% docker-start-container vscode code
とします。  
1つ目の引数はコンテナ名、2つ目の引数はコンテナで実行するコマンド名です。codeではなくlxtermとすると、コンテナ上でターミナルを開けます。  
docker-machineを使用した場合、host側の/Usersディレクトリが/Usersにマウントされています。  
コンテナ上のアカウントはdocker/dockerとしてありますが、起動時に環境変数で指定できるようにしてあります。詳しくは`run.sh`を参照してください。

## FIXME
* Visual Source Codeの最新版ダウンロードは、どのURLから行うようにすればよいのでしょう？
