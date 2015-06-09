class BookmarksController < ApplicationController
  
  def create
    @bookmark=Bookmark.new
    @bookmark.deal_id=params[:deal_id]
    if session[:user_id].blank?
      redirect_to root_url, notice: "You must login to do this action"
    else
      @bookmark.user_id=session[:user_id]
      if Bookmark.exists?(:user_id => @bookmark.user_id, :deal_id => @bookmark.deal_id)
        redirect_to root_url, notice: "You have already bookmarked this deal"
      else
        @bookmark.save
        redirect_to root_url, notice: "You just booked marked a deal"
      end
    end
    
  end

  def delete

  end

end