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
#### トップページ
<p align="center">
  <img src="https://user-images.githubusercontent.com/72494683/100242818-93f7be80-2f78-11eb-9887-a85b978f00ab.jpg" width=70%><br>
  
#### 新規登録画面
  
<img alt="新規登録画面" src="https://user-images.githubusercontent.com/72494683/100248114-6e6db380-2f7e-11eb-9120-aa02ccafe6a3.png" width=70%><br>

#### レシピ投稿画面

<img alt="roguinn" src="https://user-images.githubusercontent.com/72494683/100247755-04eda500-2f7e-11eb-8005-40d4db0b2df9.png" width=70%>
<img alt="レシピ投稿画面" src="https://user-images.githubusercontent.com/72494683/100247459-b6400b00-2f7d-11eb-992a-27d323cd544a.png" width=70%><br>
#### レシピ編集
<img alt="レシピ編集" src="https://user-images.githubusercontent.com/72494683/100244916-d15d4b80-2f7a-11eb-851e-5ad1c53cfef5.png" width=70%><br>
#### コメント、返信機能
<img alt="コメント、返信機能" src="https://user-images.githubusercontent.com/72494683/100247176-64978080-2f7d-11eb-9439-6a08d0ea9565.png" width=70%><br>
#### レシピ詳細ページ
![レシピ詳細ページ](https://user-images.githubusercontent.com/72494683/100253014-f0141000-2f83-11eb-9fc8-2c8a59b3942e.gif)<br>
#### いいね機能
![いいね機能](https://user-images.githubusercontent.com/72494683/100253157-1c2f9100-2f84-11eb-9433-ccaa656ccbbc.gif)
</p>
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
