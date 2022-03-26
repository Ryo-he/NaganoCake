class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_items = current_customer.cart_item.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end
  
  def create
    @item = Item.find(cart_item_params[:item_id])
    @cart_item = CartItem.find(params[:id])
  if CartItem.find_by(item_id: @item.id)
    @cart_item.amount += @item.cart_item.amount.to_i
  else
    @cart_item.save
    redirect_to request.referer
  end
  end
  
  def update
    @item = Item.find(cart_item_params[:item_id])
  if @item.update
    redirect_to request.referer
  else
    render :index
  end
  end
  
  def destroy
    @item = Item.find(cart_item_params[:item_id])
    @item.destroy
    redirect_to request.referer
  end
  
  def deatroy_all
    current_customer.cart_item.destroy_all
    redirect_to request.referer
  end
    
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
