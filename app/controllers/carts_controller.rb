class CartsController < ApplicationController
  before_action :set_cart!

  def show
  end

  def checkout
    @current_cart.checkout
    current_user.current_cart.destroy
    flash[:notice] = "Successfully checked out. Your cart is now empty."
    redirect_to cart_path(@current_cart)
  end

end
