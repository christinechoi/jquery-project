class ItemsController < ApplicationController
 
  def new
    @item = Item.new
    @item.build_brand
    @item.build_collection
  end


  def index
    

    if params[:collection_id]
      @items = Collection.find(params[:collection_id]).items
    else
      @items = Item.all
    end

  end

  def create
    # raise params.inspect
    @item = Item.new(item_params)
    
    if @item.save
      # binding.pry
      redirect_to item_path(@item)
    else
      # binding.pry
      redirect_to collections_path
    end
  end

  def show
    @item = Item.find(params[:id])
    #@collection = Collection.find(#id: 1)
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def item_params
    params.require(:item).permit(:collection_id, :name, :description, :quantity, brand_attributes: [:id, :name])#, collection_attributes: [:id, :title]
  end


end
