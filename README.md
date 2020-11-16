# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


## アプリケーション名
Power-Spot  
  
## アプリケーション概要
訪れたパワースポットを思い出として記録でき、他の人にも情報をシェアできるアプリとして開発しました。  
旅や訪れた場所などの記録をする上で、パワースポットに特化した媒体です。  
投稿した内容に他のユーザーが閲覧、コメントができます。  
旅の計画やスピリチュアル体験の参考に利用できる内容になっています。
  
## 使用技術（開発環境）
HTML / CSS / SCSS / Bootstrap / JavaScript / ruby 2.6.5 / rails 6.0.0 / RSpec / rubocop / MySQL2  / Git / GitHub /
  
## 作品の背景
パワースポットの記録や情報収集に特化したSNSを作りたいと思い作成したアプリです。  
  
私自身とても旅行が好きです。  
旅行は人生における思い出作りには欠かせないものです。  
訪れた先の風土や食べ物、人、空間、建物、自然、有名な場所などに価値を感じられる体験は人生を潤してくれる非常に貴重な体験の一つだと考えています。  
その中でも、神秘的な空間や不思議な力を感じられるところに行くということが最も好きな体験の一つです。  
神秘的な空間や不思議な力を感じることはパワースポット（神社や仏閣、滝などの自然にまつわる場所）を巡った時に得られる感覚だと実感しています。  
その時の感覚は特別な様に思えます。  
ただ、時間が経てばその時の情景や感じたことの記憶は時と共に薄れていき、やがて忘れてしまうのかもしれません。  
私は、その時の記憶を色褪せることなく大切に残しておきたいと考えました。  
  
また、旅の思い出を記録する媒体（SNS)はそれなりにある中で、神秘的な体験やパワースポットに焦点を当てた記録媒体というのは非常に少なく感じました。  
旅行を計画する上で、その様な参考になる情報がまとまって見れるものがあればいいなと思いました。  
参考にするものは実際本人が訪れて感じたこと、所謂生の声を綴られているものが見れることが望ましいと考えています。  
  
上記に挙げた二つの内容を友人に話した際に「それいいね！作って欲しい！パワースポットのまとまっているSNS面白いじゃん」という言葉をもらいました。  
  
今回このアプリを作るきっかけになったのは、そういったパワースポットに焦点を当てることで、巡った時に感じた感覚をより大事に残せるのではないかという思いと、その様な記録（生の声）を参考にパワースポットの情報収集できるのもがあればいいなという発想からでした。  
  
## 工夫したポイント
全体的に柔らかい印象を持たせたいということから下記を工夫いたしました。  
  
- フォントを刻明朝（Webフォント）にすることによって優しい雰囲気にしました。  
- トップページやマイページの画像の表示を丸くしました。カーソルを合わせると広がります。丸み→広がりとすることでオープンで明るい印象を狙った展開を作りました。
  
##  機能一覧
#### ユーザー機能
- ログイン・ログアウト
- ユーザー登録・削除
- プロフィール編集（画像・お気に入りスポット追加）
  
#### 投稿機能
- 新規投稿・編集・削除
  
#### コメント機能
- 新規投稿・削除
  
#### 一覧表示機能
- 投稿一覧
  
#### 検索機能
- スポット名の名前が検索対象  
  
## 実装予定の機能
- 検索タグ機能
- DMメッセージ機能
- GoogleMAPのAPI
- ユーザー同士のコミュケーションを取れる機能
  
## DB設計

### usersテーブル
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
### add_column
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| image            | string |             |
| introduction     | text   |             |
| favorite_spot    | string |             |
### Association
- has_many :posts
- has_many :comments
- has_one_attached :image


### postsテーブル
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| name             | string | null: false |
| url              | text   |             |
| impressions      | text   |             |
| user             | references | null: false |
### Association
- belongs_to :user
- has_many :comments
- has_one_attached :image


### commentsテーブル
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| comment          | text   | null: false |
| post             | references | null: false |
| user             | references | null: false |
### Association
- belongs_to :post
- belongs_to :user


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
