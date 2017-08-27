class CollectionsController < ApplicationController
  
  def index
    @collections = current_user.collections.uniq
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
    @collection_items = Array.new 
    @collection_items += @collection.items 

    @collections = current_user.collections.uniq


    if @collections.count > 1
      @clx_ids = current_user.collection_ids.uniq #array of collections
      # binding.pry
      @next_ind = @clx_ids.index(@collection.id) + 1 #index no of next clx
      @next_clx = @collections[@next_ind]
      binding.pry
    end



    respond_to do |f|
      f.html { render :show }
      f.json { render json: @collection }
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
