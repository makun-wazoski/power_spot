# README

## アプリケーション名
#### [POWER-SPOT](http://176.34.26.16/)
http://176.34.26.16/
  <img width="1439" alt="画像が見当たりません" src="https://i.gyazo.com/82e4e0e17b7d6137438b6ac104e6204f.jpg">

  
  
## アプリケーション概要
訪れたパワースポットを思い出として記録でき、他の人にも情報をシェアできるアプリとして開発しました。  
旅や訪れた場所などの記録をする上で、パワースポットに特化した媒体です。  
投稿した内容に他のユーザーが閲覧、コメントができます。  
旅の計画やスピリチュアル体験の参考に利用できる内容になっています。
  
## 使用技術
HTML / CSS / SCSS / Bootstrap / JavaScript / ruby 2.6.5 / rails 6.0.0 / RSpec / rubocop / MySQL2  / Git / GitHub / AWS(EC2,S3,VPC) / Nginx / Unicorn / Capistrano
  
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
- トップページの投稿画像一覧の表示を丸くしました。カーソルを合わせると広がります。丸み→広がりとすることでオープンで明るい印象を狙った展開を作りました。
  
##  機能一覧
#### ユーザー機能(devise)
- ログイン・ログアウト
- ユーザー登録・削除
- プロフィール編集（画像・お気に入りスポット追加）
  
#### 投稿機能
- 新規投稿・編集・削除
  
#### コメント機能
- コメント投稿・削除
  
#### 一覧表示機能
- 投稿一覧
  
#### 検索機能
- スポット名の名前が検索対象
- 検索タグで投稿を検索  

#### GoogleMap表示機能（GoogleMap API, geocoder）
- 住所入力にて投稿後表示

#### いいね機能(ajax)
- 投稿にいいねができる
  
#### ページネーション機能
  
## 実装予定の機能
- DMメッセージ機能
- フォロー機能
- 通知機能
  
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
| favorite_spot    | string | null: false |
### Association
- has_many :posts
- has_many :comments
- has_one_attached :image
- has_many :likes


### postsテーブル
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| name             | string | null: false |
| url              | text   | null: false |
| impressions      | text   | null: false |
| user             | references | null: false |
### add_column
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| perfecture_id    | integer | null: false |
| address          | string  |             |
| latitude         | float   |             |
| longitude        | float   |             |
### Association
- belongs_to :user
- has_many :comments
- has_one_attached :image
- has_many :likes


### commentsテーブル
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| comment          | text   | null: false |
| post_id          | integer | null: false |
| user_id          | integer | null: false |
### Association
- belongs_to :post
- belongs_to :user


### likesテーブル
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| post_id          | integer | null: false |
| user_id          | integer | null: false |
### Association
- belongs_to :post
- belongs_to :user


### taggingsテーブル
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| tag_id           | integer |            |
| taggable_type    | varchar |            |
| taggable_id      | integer |            |


### tagsテーブル
| Column           | Type   | Options     |
| ---------------  | ------ | ----------- |
| tag_id           | integer |            |
| name             | string |            |

  
## ER図
<img width="792" alt="画像が見当たりません" src="https://i.gyazo.com/35379aaed2eda6c0a2222bbd2f534efd.png">

## インフラ構成図
<img width="792" alt="画像が見当たりません" src="https://i.gyazo.com/4f153361e248e4fd34b20eab18b984cf.png">
