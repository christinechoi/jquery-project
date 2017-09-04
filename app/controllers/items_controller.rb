class ItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def index 
    @collections = current_user.collections.uniq
    @items = current_user.items
    if !params[:collection_id].blank?
      @items = Item.by_collection(params[:collection_id])
    else
      @items = Item.all
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    @item.collection_id = params[:collection_id]
    if @item.save
      render json: @item, status: 201
    else
      flash[:error] = "Sorry, please try again."
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @collection = @item.collection_id
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @item }
    end
  end

  def edit
    @collection = Collection.find(params[:collection_id])
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to collection_item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    @collection_id = @item.collection_id
    redirect_to collection_path(@collection_id)
  end

  private

  def item_params
    params.require(:item).permit(:collection_id, :brand, :name, :description, :cost, :purchase_date) 
  end
end
