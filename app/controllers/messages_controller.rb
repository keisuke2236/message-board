#ActionController::BaseのサブクラスであるMessagesControllerである　クラスの継承してますねこれ
class MessagesController < ApplicationController
  #フィルタを用いてedit と updateを行う前にset_messageを行うように記述する
  before_action :set_message, only: [:edit, :update,:destroy]
  #indexというアクションに対応した処理を書くことができる（これメソッドだったんだ笑）
  def index
    #おおわかるぞ，このクラスのクラスインスタンスmessageを定義してMessageクラスはあらかじめ作ってあるのだな
    #indexにアクセスした際にメッセージオブジェクトの初期化を行うことで 
    #メッセージの新規作成フォームが表示できるようになる　＝しないとオブジェクト（URL）がないのでアクセスできない
    @message = Message.new
    ##ここで1件のメッセージを作るとMessage.allの方に1けんのデータを追加できる
    #そしてその全てのデータを@messages　（複数）のやつに代入することで値を表示することができる
    #ここからindexに向かって値を渡していることがわかった
    
    #現在保存されている全てのMessageオブジェクトの内容を返すようにできている
    #なのでいつも通りeach分とか使ってぶん回すと楽しい
    @messages = Message.all
  end
  
  def edit
  end
  


  def create
    #                     モデル名の小文字_paramsで引数を受け取ることができる
    @message = Message.new(message_params)
    if @message.save
      #ここでさっきのヘルパを利用しているのですね
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  def update
    if @message.update(message_params)
      #root_pathは予約変数みたいなものだからダブルクオーとしてはいけない（戒め
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice:"#{@message.name}さん(#{@message.age})のメッセージ「#{@message.body}」を削除しました"
  end
  
  #入力内容の正規化　不正防止
  #送られてくる変数名をメソッド名に指定して params.reqire(:message).premit（：受け取りたいやつA：B）といった感じに書く
  private
  def message_params
    params.require(:message).permit(:name,:body,:age)
  end
  
  #edit と update処理の前に Messageオブジェクトの中から飛んできたparams[:id]のidで検索してあったらその値を@messageに入れる
  def set_message
    @message = Message.find(params[:id])
  end
  
  
end
