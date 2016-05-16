#ActiveRecord::BaseデータベースみたいなクラスをRailsが作ってくれているのでそれを継承して使いましょうって自動でやってくれる
#今回Message にしたので　messagesというテーブルがすでに作られているはずである　（Railsルール
class Message < ActiveRecord::Base
    # 名前は必須入力かつ20文字以内
    validates :name , length: { maximum: 20 } , presence: true
    # 年齢は0歳以上200歳未満とする　このサイト参照すると便利
    #http://railsdoc.com/validation  
    validates :age , length: { maximum: 3} , presence: true
    validates :age , numericality: {greater_than_or_equal_to:0} , presence: true
    # 内容は必須入力かつ2文字以上30文字以下
    validates :body , length: { minimum: 2, maximum: 30 } , presence: true
end
