# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
## |points|references|null: false|

### Association
- has_many :images
- has_many :markings
- has_many :stations, through: :markings

## stationsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
## |point|references|null: fales|

### Association
- has_many :images
- has_many :markings
- has_many :users, through: :markings

## markingsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, unique: true, foreign_key: true|
|station_id|references|null: false, unique: true, foreign_key: true, index: true|

### Association
- belongs_to :group
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|text|string| |
|user_id|references|null: false, unique: true, foreign_key: true|
|station_id|references|null: false, unique: true, foreign_key: true, index: true|

### Association
- belongs_to :group
- belongs_to :user


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
