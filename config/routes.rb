Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pidb_control#index"
  #root the mainpage to "controller_name#action_name"
  get "/hello" => "hello#say_hello"


  # # personalinfo
  get "/Pidb" => "pidb_control#index"
  get "/Pidb/view" => "pidb_control#view"

  # # create new info
  get "/Pidb/new" => "pidb_control#new"
  post "/Pidb" => "pidb_control#create"

  # show,edit,delete
  get "/Pidb/view/:id" => "pidb_control#show"
  # 在網址中用symbol可以會帶入那個所代表的值
  get "/Pidb/view/:id/edit" => "pidb_control#edit"
  patch "/Pidb/view/:id" => "pidb_control#update"
  post "/Pidb/view/:id" => "pidb_control#destroy"
  # 不知道post和patch前面設的網址是幹嘛的，怎麼設結果都沒差


end
