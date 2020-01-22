# README

##　Ruby/Ruby on Railsのバージョン確認をお願いします  
当アプリはRuby on Railsで開発しました。

__Rails 5.2.4.1__  
__ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-linux]__

上のバージョンに合わせてください

##　ローカルリポジトリにcloneしてください  
`git clone git@github.com:haruki-pull/kakeibo.git`   

##　gemのインストール
まずはBundlerのインストールをお願いします  
インストールがまだの場合
`gem install bundler`コマンドを実行してください  

リポジトリのclone後、  
`bundle install`コマンドでgemをインストールしてください  

##　データベースの作成

`rails db:create`  #データベースの作成  
`rails db:migrate` #データベースのマイグレーション  
`rails db:seed`    #データベースにデータの投入  

##　ローカルサーバーの起動
上までの手順の後、  
`rails s`コマンドでローカルサーバーを起動してください。
