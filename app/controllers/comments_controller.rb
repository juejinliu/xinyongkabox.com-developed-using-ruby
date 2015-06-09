class CommentsController < ApplicationController
  def new
  	@deal=Deal.find_by(id:params[:deal_id])
  	@comment=Comment.new
  end

  def create
  	@deal=Deal.find_by(id:params[:deal_id])
    @comment = Comment.new
    @comment.text = params[:comment]
    @comment.deal_id=params[:deal_id]

    if session[:user_id].blank?
      @comment.user_id=nil
    else
      @comment.user_id=session[:user_id]
    end
   
    if @comment.save
      redirect_to deal_url(@deal.id)
    else
      render 'new'
    end
    
  end

end