# テーブル設計

## users テーブル

| Column             | type    | options  |
| ----------------   |-------- |--------- |
| nickname           | string  | NOT NULL |
| email              | string  | NOT NULL |
| encrypted_password | string  | NOT NULL |
| family_name        | string  | NOT NULL |
| first_name         | string  | NOT NULL |
| family_name_kana   | string  | NOT NULL |
| first_name_kana    | string  | NOT NULL |
| birth_day          | date    | NOT NULL |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column          | type        | options            |
| --------------- |------------ |------------------- |
| title           | string      | NOT NULL           |
| description     | text        | NOT NULL           |
| category_id     | integer     | NOT NULL           |
| condition_id    | integer     | NOT NULL           |
| delivery_fee_id | integer     | NOT NULL           |
| area_id         | integer     | NOT NULL           |
| days_id         | integer     | NOT NULL           |
| price           | integer     | NOT NULL           |
| user            | references  | foreign_key : true |

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
- belongs_to :items
- has_one :address

## address テーブル

| Column       | type       | options            |
| ------------ |----------- |------------------- |
| postal_code  | string     | NOT NULL           |
| area_id      | integer    |                    |
| city         | string     |                    |
| house_number | string     | NOT NULL           |
| building     | string     |                    |
| phone_number | string     | NOT NULL           |
| purchase     | references | foreign_key : true |

### Association

- belongs_to :purchase