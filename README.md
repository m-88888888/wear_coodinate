# WEAR_COODINATE
<img width="1680" alt="スクリーンショット 2020-01-13 14 03 25" src="https://user-images.githubusercontent.com/51853475/72233954-9f1a5800-360d-11ea-8c14-b268e6d6af8c.png">

スキー・スノーボードウェアのコーディネートの共有サイトです。
転職活動用のポートフォリオとして作成致しました。

# App URL
https://wear-coodinate.herokuapp.com/

# 機能
- ユーザー登録、ログイン機能（device)
- コーディネート投稿機能（CRUD)
  - 画像投稿（carrierwave)
  - 投稿フォーム追加機能（nested_form_fields)
  - コーディネートランキング機能
  - 性別毎表示機能
  - 特定のアイテムを使ったコーディネート検索機能
  - アイテム絞り込み検索機能
  - いいね機能（ajax)

# 使用技術
- Ruby 2.6.3
- Ruby on Rails 5.2.3
- MySQL 5.7
- Bootstrap4
- RSpec(単体テスト、システムテスト)
  - Capybara
- Git/Github
- Heroku
- AWS S3

# 力を入れたところ
## 1. 特定のアイテムを使ったコーディネート検索機能
![item_search mov](https://user-images.githubusercontent.com/51853475/72249862-a5c0c380-363d-11ea-96bc-94318436a693.gif)

既に投稿されたコーディネートから、特定のアイテムを使ったコーディネートを検索することができる機能です。
検索条件に指定したアイテムが使われているコーディネートを検索していますが、「アイテムが使われている状態」とは何かを定義することに少し苦戦しました。
実質、この機能を実装するためにこのサイトを作りました。

## 2. アイテム絞り込み検索機能
![search mov](https://user-images.githubusercontent.com/51853475/72250372-cfc6b580-363e-11ea-8234-43134d1ec1f3.gif)

`1.特定のアイテムを使ったコーディネート検索機能`のためのアイテム検索機能です。
選択した条件のみが検索条件となるようにするためにはどのようにすればよいかを考える点に苦労しました。

## 3. 投稿フォームの追加機能
![coodinate_toukou mov](https://user-images.githubusercontent.com/51853475/72247624-a145dc00-3638-11ea-9e37-2ec900fbeb59.gif)

コーディネートに使ったアイテムの数だけ、動的に投稿フォームを追加できる機能です。
動的に追加される各投稿フォームの画像アップローダーに、画像プレビュー機能を追加したかったのですが、JavaScriptの理解度がまだ足りていないため実装できず仕舞いです。
