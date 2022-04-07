class Public::CustomersController < ApplicationController
  def show
    
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
  if @customer.update(customer_params)
     redirect_to customer_path(current_customer)
  else
    render :index
  end
  end

  def unsubscribe
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end
end
