Rails.application.routes.draw do
  # rake routes  で現在のルート確認ができるよ
  root 'messages#index'
  #どのURLに対してどのコントローラーのどのアクションなのかを設定している
  
  #resourcesとはリソースを操作するURLを作るメソッドである
  #messagesモントローラーのcreateアクションかな
  #今回の場合はメッセージというリソースのクリエイトのみを作成してくださいって書いてるから
  
  #resources :messages , only: [:create]
  
  #messages POST /messages(.:format) messages#create　　こんな感じでクリエイトだけ出来るわけで
  #いかのようにこれだけ書いたら　一覧表示，作成処理，新規作成，編集，個別画面，更新処理，削除処理全部作ってくれちゃうわけですね
  resources :messages
  #ここで使えるヘルパの名前も作ってくれる
  #これがあると　/messages/:id/editとか入力しなくても edit_message_pathといった感じで使えるので覚えやすい？
  #ヘルパ名	対応するHTTPリクエスト名	出力されるURL
  #messages_path	GET/POST	/messages
  #new_message_path	GET	/messages/new
  #edit_message_path	GET	/messages/:id/edit
  #message_path(id)	GET/PATCH/PUT/DELETE	/messages/:id
  
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
