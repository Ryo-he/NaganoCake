class Admin::OrderedItemsController < ApplicationController
def update
     @ordered_item = OrderedItem.find(params[:id])
  if @ordered_item.update(ordered_item_params)
    redirect_to admin_order_path
  else
    render :index
  end
end

  private
  def ordered_item_params
    params.require(:ordered_item).permit(:is_active)
  end
end