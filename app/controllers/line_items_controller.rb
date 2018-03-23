class LineItemsController < ApplicationController
  before_action :set_cart!

  def create
    if current_user.current_cart == nil
      new_cart = Cart.create(:user_id => current_user.id)
      current_user.current_cart = new_cart
      current_user.save
    end
    line_item = current_user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart), {notice: 'Item added to cart!'}
    else
      redirect_to store_path, {notice: 'Unable to add item'}
    end
  end

end
