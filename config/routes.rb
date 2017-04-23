Rails.application.routes.draw do
	get "/pidb_control/view" => "pidb_control#view"
	# move to top不然會被resources定義的show給搶先
	post "/pidb_control/:id" => "pidb_control#destroy"
	# Delete不知為何都無法被html所接受，好像是js檔遺失，所以這邊直接用post來取代Delete，
	# 然後因為route是由上往下讀，為了別被resources覆蓋，把這個加在上面
	resources :pidb_control
	# automatically set these route for you
	# index,show,new,create,edit,update,destroy
 #  pidb_control_index GET    /pidb_control(.:format)          pidb_control#index
 #                   POST   /pidb_control(.:format)          pidb_control#create
 #  new_pidb_control GET    /pidb_control/new(.:format)      pidb_control#new
 # edit_pidb_control GET    /pidb_control/:id/edit(.:format) pidb_control#edit
 #      pidb_control GET    /pidb_control/:id(.:format)      pidb_control#show
 #                   PATCH  /pidb_control/:id(.:format)      pidb_control#update
 #                   PUT    /pidb_control/:id(.:format)      pidb_control#update
 #                   DELETE /pidb_control/:id(.:format)      pidb_control#destroy
 #              root GET    /                                pidb_control#index







  # root "pidb_control#index"
  #root the mainpage to "controller_name#action_name"
  # get "/hello" => "hello#say_hello"


  # # # personalinfo
  # get "/Pidb" => "pidb_control#index"
  # get "/pidb_control/view" => "pidb_control#view"


  # # # create new info
  # get "/Pidb/new" => "pidb_control#new"
  # post "/Pidb" => "pidb_control#create"

  # # show,edit,delete
  # get "/Pidb/view/:id" => "pidb_control#show"
  # # 在網址中用symbol可以會帶入那個所代表的值
  # get "/Pidb/view/:id/edit" => "pidb_control#edit"
  # patch "/Pidb/view/:id" => "pidb_control#update"
  # post "/Pidb/view/:id" => "pidb_control#destroy"
  # # 不知道post和patch前面設的網址是幹嘛的，怎麼設結果都沒差


end
