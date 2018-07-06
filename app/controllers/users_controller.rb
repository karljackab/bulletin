class UsersController < ApiController
	require 'bcrypt'

	def index
		@users=User.all
		respond_to do |format|
			format.json {render json:@users}
			format.html {render :index}
		end
	end

	def create
		psd=BCrypt::Password.create(params['user_status'])
		@user=User.new({account:params['account'],\
						password:psd,\
						user_status:params['user_status']})
		@user.save
		session[:cart1] = "abc"
		puts session[:cart1]
		redirect_to '/events'
	end
end
