# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password1       | string | null: false |
| password2       | string | null: false |
| firstname       | string | null: false |
| firstname_kana  | string | null: false |
| familyname      | string | null: false |
| familyname_kana | string | null: false |
| date            | date   | null: false |

### Association

- has_many :items
- has_many :item_buyers


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| category_id  | integer    | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| condition_id | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| charge_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :item_buyer
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :area
- belongs_to_active_hash :day
- belongs_to_active_hash :charge



## item_buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ----------    | ---------- | ------------------------------ |
| buyer         | references | null: false, foreign_key: true |
| addressnum    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| housenum      | string     | null: false                    |
| building      | string     | null: false                    |
| phonenum      | string     | null: false                    |

### Association

- belongs_to :item_buyer
- belongs_to_active_hash :prefecture_id 

