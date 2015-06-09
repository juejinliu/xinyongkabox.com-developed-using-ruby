class DealsController < ApplicationController
  before_action :require_user, :only => [:new, :edit, :update, :destroy]
  before_action :find_deal, :only => [:show, :edit, :update, :destroy]
  def find_deal
    @deal = Deal.find_by(id: params["id"])
  end


  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end

  def index
    if params["keyword"].present?
      @deals=Deal.where("lower(title) LIKE ? OR lower(description) LIKE ?","%#{params[:keyword]}%".downcase,"%#{params[:keyword]}%").limit(100)
    else
      @deals=Deal.all.limit(100)
    end

    @deals=@deals.order('title asc').page(params[:page]).per(5)
  end

  def show
    if @deal == nil
      redirect_to deals_url, notice: "Deal not found."
    else
      cookies["deal_history_id"] ||=""
      if !cookies["deal_history_id"].include?(@deal.id.to_s)
        cookies["deal_history_id"] += "#{@deal.id} "
      end
    end
  end

  def new
    @deal=Deal.new
  end

  def create
    d=params.require(:deal).permit(:title, :title_picture, :purchase_link, :category, :description)
    @deal=Deal.new(d)

    # @deal = Deal.new
    # @deal.title = params[:title]
    # @deal.title_picture = params[:title_picture]
    # @deal.purchase_link = params[:purchase_link]
    # @deal.category = params[:category]
    # @deal.description = params[:description]
    @deal.created_at = DateTime.now
    if @deal.save
      redirect_to deals_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    d=params.require(:deal).permit(:title, :title_picture, :purchase_link, :category, :description)
    @deal.title = params[:deal][:title]
    @deal.title_picture = params[:deal][:title_picture]
    @deal.purchase_link = params[:deal][:purchase_link]
    @deal.category = params[:deal][:category]
    @deal.description = params[:deal][:description]
    if @deal.save
      redirect_to deals_url
    else
      render 'edit'
    end
  end

  def destroy
    @deal = Deal.find_by(id: params["id"])
    @deal.delete
    redirect_to deals_url
  end

end
