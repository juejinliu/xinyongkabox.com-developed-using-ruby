class UsersController < ApplicationController
	def new
		@user=User.new
	end

	def create
		@user=User.new
		@user.name=params[:name]
		@user.email=params[:email]
		@user.password=params[:password]
		if @user.save
			redirect_to root_url, notice: "Thanks for signing up!"
		else
			render 'new'
		end
	end

end