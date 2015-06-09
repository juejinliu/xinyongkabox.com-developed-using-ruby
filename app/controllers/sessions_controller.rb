class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to root_url, notice: "Welcome back!"
      else
        redirect_to root_url, notice: "Unknown password."
      end
    else
      redirect_to root_url, notice: "Unknown email."
    end
  end

  def delete
    if session["user_id"].present?
      
      session.delete "user_id"
      cookies.delete "deal_history_id"
    else
      redirect_to root_url, notice:"Logout with a problem!"
    end
    redirect_to root_url, notice: "Logged out!"
  end
end