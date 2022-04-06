class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
    @subtotal = 0
    @order.postage = 800
    @total = 0

  end
  
end
