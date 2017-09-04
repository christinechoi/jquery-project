class CollectionsController < ApplicationController
  
  def index
    @collections = current_user.collections.uniq
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @collections }
    end
  end

  def new
    @collection = Collection.new
  end 

  def create
    @collection = current_user.collections.build(collection_params)
    @collection.items.last.user_id = current_user.id
    if @collection.save
      redirect_to collection_path(@collection)
    else
      flash[:error] = "Sorry, please try again."
      render :new
    end
  end

  def show
    @collection = Collection.find(params[:id])
    @collections = current_user.collections.uniq
    
    @collection_items = Array.new 
    @collection_items += @collection.items 

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @collection }
    end

  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to collections_path
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :user_id, items_attributes: [:id, :name, :brand, :description, :purchase_date])
  end
end
