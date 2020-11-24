#アプリ名
RECIPE SHARE

#概要
ログインしていないユーザー：レシピ一覧、レシピの詳細、レシピ投稿者の投稿レシピを見ることができる
ログインしているユーザー：レシピ一覧、レシピ詳細、レシピの投稿、レシピの（編集機能、削除機能、コメント機能、コメントに返信機能、いいね機能)

#本番環境
http://52.69.205.104/
ユーザー認証
・ユーザー名:admin
・パスワード：2222

ログイン情報（テスト用）
ユーザー名　太郎
・Eメール：a@a.com
・パスワード：o00000

ユーザー名　o
・Eメール：o@o.com
・パスワード：o00000

#制作背景（意図）
今回初めて、アプリを初めから実装してみました。ペルソナは料理の献立に悩まれている方（男性も料理をする方がいらっしゃるので、このような言い回しです）
毎日３回以上料理をすると思うので、献立に困ってしまう方も多いと思いました。

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
