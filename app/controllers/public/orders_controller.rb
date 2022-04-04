class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
  if @order.save
    cart_items.each do |cart_item|
      ordered_item = OrderedItem.new
      ordered_item.item_id = cart_item.item_id
      ordered_item.order_id = @order.id
      ordered_item.amount = cart_item.amount
      ordered_item.purchase = cart_item.item.price
      ordered_item.save
    end
  redirect_to public_complete_path
  cart_items.destroy_all
  else
    @order = Order.new(order_params)
    render :new
  end


  end

  def complete
  end

  def confirm
      @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
       @order = Order.new(order_params)
       @order.address = current_customer.address
       @order.postal_code = current_customer.postal_code
       @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "2"
       @order = Order.new(order_params)
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.resident
       @order.delivery_name = @address.name
    elsif params[:order][:select_address] == "3"
       @order = Order.new(order_params)
    end


    @cart_items = current_customer.cart_items
    @total = 0
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @ordered_item = OrderedItem.find(params[:id])
    @cart_items = current_customer.cart_item.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @payment_amount = @order.postage + @total
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :delivery_name, :payment_amount)
  end
end
