# アプリ名
RECIPE SHARE

# 概要
<br>ログインしていないユーザー：レシピ一覧、レシピの詳細、レシピ投稿者の投稿レシピを見ることができる<br>
<br>ログインしているユーザー：レシピ一覧、レシピ詳細、レシピの投稿、レシピの（編集機能、削除機能、コメント機能、コメントに返信機能、いいね機能)<br>

# 本番環境
http://52.69.205.104/
<br>ユーザー認証<br>
<br>・ユーザー名:admin<br>
<br>パスワード：2222<br>

<br>ログイン情報（テスト用）<br>
<br>ユーザー名　太郎<br>
<br>・Eメール：a@a.com<br>
<br>・パスワード：o00000<br>

<br>ユーザー名　o<br>
<br>・Eメール：o@o.com<br>
<br>・パスワード：o00000<br>

# 制作背景（意図）
今回初めて、アプリを初めから実装してみました。ペルソナは料理の献立に悩まれている方（男性も料理をする方がいらっしゃるので、このような言い回しです）
毎日３回以上料理をすると思うので、献立に困ってしまう方も多いと思いました。そこで今回、気軽にレシピを投稿できたり、閲覧したりシェアできるアプリがあれば意見交換もでき、複数回の料理が楽しくできるのではないかと考え制作にあたりました。

# DEMO
<br>![トップページ](548c4f38e96ae6ad82b6b257ee937a55.jpn"トップページ")
<br>[新規登録ページ](https://gyazo.com/687ee266a1d42db30a513f24e76a3a5a)
ログインページ：https://gyazo.com/704b27fec42e58bd0f0484d9e5797fe3
新規投稿ページ：https://gyazo.com/02df21783ea7eb6b149d7c617e85a915
レシピ詳細ページ：https://gyazo.com/d67fe141ccbd9871774db319c7826379
レシピ編集ページ：https://gyazo.com/9a5c806e7e7461e50e0b37c944aaef61
いいね機能：https://gyazo.com/cf56dd116f862c73ff6f6a5e9e0e19d8
コメント、返信機能：https://gyazo.com/71408318f6fd4854b1404f07400ec1e8

# 工夫したポイント
気に入ったレシピに対してのいいね機能を、コメントに対しての返信機能は付けたてレシピを投稿した人、そのレシピを参考に作ってみた方との間をなるべく近くして、シェアということがしやすいようにしたいと思い実装したことが工夫した点になります。<br>
<br>また、背景色が単色であったりすると味気がない上に、少しでもアクセスしたときに好感を持ってもらい、またアクセスしてもらえるようにトップページのレイアウトには力を入れ、工夫をしました。<br>
## 使用した技術（開発環境）
HTML・CSS・Ruby・Ruby on Rails・JavaScript・GitHub 

## 課題や今後実装したい機能
課題は、返信機能がついてはいるのですが見にくかったり、実用的ではないため改良が必要だと感じています。<br>
<br>今後実装したい機能としては、検索機能やSNSとの連携ができるようにしてレシピの検索がしやすくなるように改良したり、新規登録時にSNSのアカウントで簡単に登録ができるようにして、より使いやすいように改良が必要だと思っています。<br>

# テーブル設計
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
### Association

- has_many :recipes
- has_many :comments
- has_many :goods

## recipe テーブル

| Column   | Type    | Options     |
| ------   | ------  | ----------- |
| title    | string  | null: false |
|user_id   |reference| null:false  |
|body      |text     | null:false  |


### Association

- belongs_to: user
- has_many :comments
- has_many :goods

## comments テーブル

| Column   | Type    | Options     |
| ------   | ------  | ----------- |
| text     | text    | null: false |
|recipe_id |reference|             |
|user_id   |reference|             |


### Association

- belongs_to: user
- belongs_to: recipe


## goods テーブル

| Column   | Type    | Options     |
| ------   | ------  | ----------- |
| user_id  |reference|             |
|recipe_id |reference|             |         

### Association
- belongs_to: user
- belongs_to: recipe
