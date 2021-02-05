# テーブル設計

## users テーブル

| Column           | type    | options  |
| ---------------- |-------- |--------- |
| nickname         | string  | NOT NULL |
| email            | string  | NOT NULL |
| password         | string  | NOT NULL |
| family_name      | string  | NOT NULL |
| first_name       | string  | NOT NULL |
| family_name_kana | string  | NOT NULL |
| first_name_kana  | string  | NOT NULL |
| birth_day        | integer | NOT NULL |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column       | type        | options            |
| -------------|------------ |------------------- |
| image        |             | NOT NULL           |
| title        | string      | NOT NULL           |
| description  | text        | NOT NULL           |
| category     | ActiveHash  | NOT NULL           |
| condition    | ActiveHash  | NOT NULL           |
| delivery_fee | ActiveHash  | NOT NULL           |
| area         | ActiveHash  | NOT NULL           |
| days         | ActiveHash  | NOT NULL           |
| price        | integer     | NOT NULL           |
| user         | references  | foreign_key : true |

### Association

- belongs_to :users
- has_one :purchase

## purchase テーブル

| Column | type       | options            |
| ------ |----------- |------------------- |
| user   | references | foreign_key : true |
| item   | references | foreign_key : true |

### Association

- belongs_to :users
- has_one :items
- has_one :address

## address テーブル

| Column       | type       | options            |
| ------------ |----------- |------------------- |
| postal_code  | integer    | NOT NULL           |
| prefecture   | ActiveHash |                    |
| city         | ActiveHash |                    |
| house_number | string     | NOT NULL           |
| building     | string     |                    |
| phone_number | string     | NOT NULL           |


### Association

- has_one :purchase