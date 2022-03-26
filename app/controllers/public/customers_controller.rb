class Public::CustomersController < ApplicationController
  def show
    
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
  if  @customer.update
    redirect_to public_customer_path(current_customer)
  else
    render :index
  end
  end

  def unsubscribe
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    redirect_to root_path
  end
end
