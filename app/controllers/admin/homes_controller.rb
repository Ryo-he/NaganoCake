class Admin::HomesController < ApplicationController
  def top
    @orders = Order.(params[:page])
  end
end
