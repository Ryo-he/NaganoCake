class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
   # @item = Item.find(cart_item_params[:item_id])
  #if CartItem.find_by(item_id: @item.id)
   # @item.amount += @item.cart_item.amount.to_i
  #else
   # @item.save
    #redirect_to request.referer
  #end
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id

  if current_customer.cart_items.find_by(item_id: @cart_item.item_id).present?
    @cart_item_exist = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    @cart_item_exist.amount += @cart_item.amount
    @cart_item_exist.save
  else
    @cart_item.save

  end
    redirect_to public_cart_items_path
  end

  def update
     @cart_item = CartItem.find(params[:id])
  if @cart_item.update(cart_item_params)
    redirect_to request.referer
  else
    render :index
  end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
