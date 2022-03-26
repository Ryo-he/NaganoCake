class Admin::OrderedItemsController < ApplicationController
def update
  @ordered_item = OrderedItme.find(params[:id])
  OrderedItem.update
  redirect_to order_path(@order.id)
end
end
