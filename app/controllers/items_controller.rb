class ItemsController < ApplicationController
    before_action :set_item, except: [:index, :new, :create]

def show
    @item = Item.find(params[:id])
    @items = @item.items
  end

  def new
    @item = item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to item_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
  @item.destroy
    redirect_to items_path
  end

  private
    
    def set_item
      @item = item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name)
    end
end
