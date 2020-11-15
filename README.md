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