class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
    @subtotal = 0
    @order.postage = 800
    @total = 0

  end
  def update
     @order = Order.find(params[:id])
     @ordered_item = OrderedItem.find(params[:id])
  if @ordered_item.update(ordered_item_params)
    redirect_to admin_order_path(@order.id)
  else
    render :index
  end
  end

  private
  def ordered_item_params
    params.require(:ordered_item).permit(:is_active)
  end
end
