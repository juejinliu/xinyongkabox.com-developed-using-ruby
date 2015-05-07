class DealsController < ApplicationController

  def index
    # if(params["deal name"].present?)
    #   @deals = Deal.where("title like '%#{params["Deal name"]}%'")
    # else
    #   @deals = Deal.all
    # end
    @deals=Deal.order('title asc')
  end

  def show
    @deal = Deal.find_by(id: params["id"])

    if @deal == nil
      redirect_to deals_url, notice: "Deal not found."
    end
  end

  def new
    
  end

  def create
    deal = Deal.new
    deal.title = params[:title]
    deal.title_picture = params[:title_picture]
    deal.purchase_link = params[:purchase_link]
    deal.category = params[:category]
    deal.description = params[:description]
    deal.created_at = DateTime.now
    deal.save
    redirect_to deals_url
  end

  def edit
    @deal = Deal.find_by(id: params["id"])
  end

  def update
    deal = Deal.find_by(id: params["id"])
    deal.title = params[:title]
    deal.title_picture = params[:title_picture]
    deal.purchase_link = params[:purchase_link]
    deal.category = params[:category]
    deal.description = params[:description]
    deal.created_at = DateTime.now
    deal.save
    redirect_to deals_url
  end

  def destroy
    deal = Deal.find_by(id: params["id"])
    deal.delete
    redirect_to deals_url
  end

end
