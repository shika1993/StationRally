# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

 DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
## |points|references|null: false|

### Association
- has_many :images
- has_many :users_stations
- has_many :stations, through: :users_stations

## stationsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
## |point|references|null: fales|

### Association
- has_many :images
- has_many :users_stations
- has_many :users, through: :users_stations

## users_stationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|station_id|references|null: false, foreign_key: true, index: true|
## controllerにて、「user_id」と「station_id」のペアがすでにある場合はsaveアクションを実行しないようにする記述を行う。

### Association
- belongs_to :station
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|text|string| |
|user_id|references|null: false, unique: true, foreign_key: true|
|station_id|references|null: false, unique: true, foreign_key: true, index: true|

### Association
- belongs_to :station
- belongs_to :user


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
test