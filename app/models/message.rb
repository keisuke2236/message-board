#ActiveRecord::BaseデータベースみたいなクラスをRailsが作ってくれているのでそれを継承して使いましょうって自動でやってくれる
#今回Message にしたので　messagesというテーブルがすでに作られているはずである　（Railsルール
class Message < ActiveRecord::Base
    
end
