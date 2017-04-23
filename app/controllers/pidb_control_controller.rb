class PidbControlController < ApplicationController
	before_action :find_DBobject, only:[:show,:edit,:update,:destroy]
	# 在特定action執行前先執行 method find_DBobject
	# 可以省略重複程式碼

	def index
	end
	def view
		@allpi=PersonalInfo.all
		# refer @allpi to a db object

	end
	
# add new onfo to DB
	def new
		@newpi=PersonalInfo.new
		# @newpi是從db實體化的物件，會傳進new.html.erb的form當參數，然後會以 :newpi 這個hash post 到method create
	end
	
	def create
		@newpi=PersonalInfo.new(split_params)
		# 用method get_params 來取得多個分別的database參數(not hash)
		@newpi.save
		# save the info
		if @newpi.save
			flash[:notice]="data was successfully created"
			redirect_to :action => :view
			# 讓controller 呼叫 :action =>view
		else
			render :action => :new
			# :action=>:action_name 並不是真的呼叫那個action，而是傳給那個action handle的樣板，即是在routes.rb那裡的path
			# 像這裡就是直接把 views/pidb_control/new.html.erb render 進來
		end
	end
	
# shoe,edit,delete
	def show
		
		# get the object in DB with the set id in the params
		@custom_title=@piid.name
		# send @custom_title to layout/application.html.erb
	end
	def edit
		
	end
	def update
		
		@piid.update(split_params)
		# update don't need to @piid.save
		if @piid.update(split_params)
			flash[:notice]="data was successfully updated"
			# 這是rails的特殊變數flash(hash)，可以帶著資料前往另一個action（用redirect_to），類似可以運輸一次的暫存資料
			redirect_to :action =>:view
		else
			render :action => :edit
		end
	end
	def destroy
		flash[:alert]="data was successfully destroyed"
		@piid.destroy
		redirect_to :action => :view
	end


	private
	def split_params
		params.require(:personal_info).permit(:name, :age, :description)
		# 你可能會想說params這個var是在哪定義的，其實params是用戶端發送request到server時自動產生的一個參數，
		# 包含了所有從用戶端傳來的資料，所以在這裡我們用
		# params.require(:your_db 這裡不能用PersonalInfo的原因是PersonalInfo是"呼叫"這個module時用的，
		# 而要"關聯"這個module時要用symbol的型態來關聯，symbol型態全小寫)來得到所有此回傳var的內部物件(會是一個hash)，然後再用
		# .permit(:object1, :object2,....)把物件分開，然後return出:DB_name:object1,:DB_name:object2等多個參數
	end

	def find_DBobject
		@piid=PersonalInfo.find(params[:id])
	end
end
