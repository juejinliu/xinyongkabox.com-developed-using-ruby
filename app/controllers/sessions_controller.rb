class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.password == params[:password]
        cookies["user_id"] = user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        redirect_to root_url, notice: "Unknown password."
      end
    else
      redirect_to root_url, notice: "Unknown email."
    end
  end

  def delete
    if cookies["user_id"].present?
      cookies.delete "user_id"
    else
      puts "error, no such sesson"
    end
    redirect_to root_url, notice: "Logged out!"
  end
end