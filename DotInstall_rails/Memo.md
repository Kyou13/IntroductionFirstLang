# 03 Scaffold
- appを簡単に作る仕組み
#04 ディレクトリ構造を確認
- MVCはappフォルダ内に存在
#05 モデルを作ってみよう
- rails g(enerate) model Post title:string body:text
-- stringは一行テキスト textは複数行
- コンソールからdbにデータ挿入 rails c
-- p = Post.new(title: 'title 1', body: 'body 1')
-- p.save
-- 以上2処理まとめるPost.create
-- 全データ見る Post.all 
## 引っかかった
- title:String -> title:string
## Memo
- generate やり直すときはdestroy
- migrate やり直すときは rake db:rollback , 最初の状態に戻すrake db:migrate VERSION=0

# 06 初期データを流し込んでみよう
- データベースに接続 rails db 
- テーブルリセット rails db:migrate:reset
- db/seed.rbに挿入データを記述し、rails db:seed で挿入出来る

# 07,08　コントローラーを作成
- rails g controller Posts
- 一般的なルーティング設定config/routes.rb にresources :postsを記述
- ルーティング確認 rails routes
- app/controller/posts_controller.rb にdef index 記述.作成日時順に並び替え.
- app/views/posts/index.html.erb 作成
- controllerでデータ引っ張ってきて,viewに埋め込む

# 09 rootパスを設定
- rootパスにアクセスしたとき,記事一覧表示したい
- config/routes.rb にroot 'posts#index'追加
- Convention over Configuration (CoC) 規約によってコード量を減らす

# 10 画面をカスタマイズしてみよう
- 先程の記事一覧にはtitleなども自動で設定されている
- app/views/layouts/application.html.erbを読み込んでいる
- 上記ファイルのyield部分にviewで書いたコード読み込まれる
- app/assets/stylesheets/application.css にデザイン記述
 
# 11 link_toヘルパーを使ってみよう
- 記事のタイトルをクリックして記事の詳細画面を表示 
- postにidをつけてGETでアクセスするURLが使われる
- showアクションを作る
- リンクを貼る link_to
- controller.rbにPost.find(params[:id])
-- :idはルーティングから

# 12 記事の詳細を表示してみよう 11の続き
- app/views/posts/show.html.erb作成
- リンク先の詳細画面を記述

# 13 画像にリンクを貼る
- 記事の詳細画面から一覧に戻るリンクを作成
- ロゴ画像を配置してそこに記事一覧のリンクを貼る
- app/assets/imagesにロゴ画像配置
- application.html.erbにタグを記述
- image_tagで画像配置できる
- そのままだと大きいのでcssで調整

# 14  記事を追加できるようにしよう
- 記事新規作成linkを作成
- def new, def create 作成
- new.html.erbを作成
- *.html.erbファイル内のurl:はrails routes のURI Patternに対応*

# 15 新規作成フォームを作ろう
- form_for フォームを作成のためのヘルパー
- text_field 一行入力テキストボックスのためのヘルパー
- text_area 複数行テキストボックスのためのヘルパー
- placeholder 仮入力文字を指定するオプション
- input[type="text"] @css 一行テキストボックスに対応するタグ

# 16 Strong Parameters 
- render plain: @controller はデータをそのまま出力

# 17 バリデーションを設定
- 空データはPOST出来ないようにする
- app/models/post.rb にvalidatesを記述
-- presence: true で空入力禁止
- post.rbにvalidation記述
- Controllerのdef createに空データだった場合の分岐を記述
- error message は自動生成してくれるがpost.rbで指定可能

# 18 エラーメッセージを表示しよう
- 入力フォームでエラーを表示したい
- postControllerにrender newを記述
-- new.html.erbにエラー時の表示を記述
-- error時,[title][0]を表示(can't be blank)
- PostController def newでPost Obj作成しないとエラー発生
-- viewでpostを定義しているので

# 19 編集フォームを作成
- editアクションを作成
-- /posts/:id/edit(.:format) posts#edit
- V:ホーム画面に[Edit]ボタン設置,index.htmlにlink_to edit 作成
- C:def edit作成 showを流用
- V:edit.html.erb 作成new.htmlを流用

# 20 記事を更新してみよう
- C:def update作成 バリデーションも設定
- show.html にsimple_formatヘルパーを記述することで改行を適切に扱う

# 21 Partialで共通部分を作成
- new, editは同じような処理なので
- app/views/posts にPartialファイルを作成　
-- _から始まる.html.erbファイル
- 違う部分はどうなる？
-- resoucesを使ってる場合いい感じに解釈してくれる
- Partialファイル読み込むには<%= render 'form' %>
-- _を除くファイル名を指定

# 22 記事の削除
- routesはpost DELETE /posts/:id(.:format) 
- V: ホーム画面に[x]追加,method Delete,確認ダイアログdataを追加

# 23 コメントモデルを作成
- 記事に対する処理は一通り終了
- bundle exec rails g model Comment body:string post:references 
-- references でpostと紐付ける
- dbに反映migrate
- app/models/comment.rbが作成される
-- belongs_to :post はpostに紐付いているということ
- post.rbにも紐付いていることを記述
-- has_many :comments
- ルーティングも設定 config/routes.rb
- コントローラー作成 bundle exec rails g controller Comments

# 24 コメント追加フォームを作成
- Routes new_post_comment GET    /posts/:post_id/comments/new(.:format)      comments#new
- show.htmlにCommentsフォームを記述
- CSS設定(h3)

# 25 コメントの保存
- commentsController作成
- def create作成
-- @post.comments.createでいきなり作成するようにする

# 26 コメントの一覧を表示しよう
- show.htmlを編集
- C はdef showで@postを定義済みなのでコメントには@post.commentsでアクセスできる

# 27 コメントを削除できるように
- routes post_comment DELETE /posts/:post_id/comments/:id(.:format)      comments#destroy
- show.htmlに[x] 流用
- C:destroyアクション作成
- 使用するroutesはcreate destroyだけなので,routes.rbに設定 only: []

# 28 記事を削除したときに関連するコメントも削除
- has_many :comments, dependent: :destroy
- rails dbselect * from comments where post_id=(id); で確認すると削除されている
