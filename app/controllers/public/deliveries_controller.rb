class Public::DeliveriesController < ApplicationController
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
     @address = Address.new(address_params)
     @address.customer_id = current_customer.id
  if @address.save
     redirect_to request.referer
  else
     @addresses = Address.all
     render :index
  end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to deliveries_path
    else render :edit
    end
  end

  def destroy
   @address = Address.find(params[:id])
   @address.destroy
   @addresses = Address.all
   redirect_to deliveries_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :resident)
  end
end
