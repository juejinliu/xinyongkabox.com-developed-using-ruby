class LikesController < ApplicationController
  
  def create
    @like=Like.new
    @like.deal_id=params[:deal_id]
    if session[:user_id].blank?
      redirect_to root_url, notice: "You must login to do this action"
    else
      @like.user_id=session[:user_id]
      @like.like_value=1
      if Like.exists?(:user_id => @like.user_id, :deal_id => @like.deal_id)
        redirect_to root_url, notice: "You have already liked this deal"
      else
        @like.save
        redirect_to root_url, notice: "Thanks for Liking the deal"
      end
    end
    
  end

end