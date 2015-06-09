class UsersController < ApplicationController

	before_action :authorize, only: [:show]

	def authorize
		@user=User.find_by(id:params[:id])
		if @user.blank? || session[:user_id] != @user.id
			redirect_to root_url, notice: "You don't have permission to access this page"
		end
	end
	
	def new
		@user=User.new
	end

	def show

	end

	def create
		@user=User.new(email:params[:email], name:params[:name], password: params[:password])
		if @user.save
			redirect_to root_url, notice: "Thanks for signing up!"
		else
			render 'new'
		end
	end

end