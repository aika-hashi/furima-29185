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

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password1   | string | null: false |
| password2   | string | null: false |
| familyname1 | string | null: false |
| firstname1  | string | null: false |
| familyname2 | string | null: false |
| firstname2  | string | null: false |
| date        | date   | null: false |

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| category_id  | integer    | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| image        | string     | null: false                    |
| condition_id | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| charge_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer      | references | null: false, foreign_key: true |
| addressnum | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| housenum   | string     | null: false                    |
| building   | string     | null: false                    |
| phonenum   | string     | null: false                    |

### Association

- belongs_to :user

