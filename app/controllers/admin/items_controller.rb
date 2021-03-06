class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
    @item = Item.new
    @items = Item.page(params[:page])
    @genres = Genre.all
  end
  def create
     @item = Item.new(item_params)
  if @item.save
    redirect_to admin_item_path(@item.id)
  else
    @items = Item.page(params[:page])
    render :index
  end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  def update
    @item = Item.find(params[:id])
  if @item.update(item_params)
   redirect_to admin_item_path(@item.id)
  else
   @genres = Genre.all
   render :edit
  end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
end
