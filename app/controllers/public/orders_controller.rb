class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  if @order.save
    redirect_to '/orders/confirm'
  else
    render :new
  end 
  end
  
  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
  if @order.save
    cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.order_id = @order.id
      order_item.amount = cart_item.amount
      order_item.purchase = cart_item.item.price
    order_item.save
    end
  redirect_to '/orders/complete'
  cart_items.destroy_all
  else
    @order = Order.new(order_params)
    render :new
  end
      
    
  end

  def complete
  end
  
  def confirm
    if @order.address = current_customer.address
       @order = Order.new(order_params)
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.delivery_name = current_customer.name
    elsif 
       @order = Order.new(order_params)
    else
       @order = Order.new(order_params)
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.delivery_name = @address.name
    end
    
    @cart_items = current_customer.cart_item.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @payment_amount = @order.postage + @total
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
