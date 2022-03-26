class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @customer = Customer.find(params[:id])
  end
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @ordered_items = OrderedItem.all
    @ordered_item = OrderedItme.find(params[:id])
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @payment_amount = @order.postage + @total
  end
  def update
    @ordered_item = OrderedItme.find(params[:id])
  if @ordered_item.update
    redirect_to order_path(@order.id)
  else
    render :index
  end
  end
end
