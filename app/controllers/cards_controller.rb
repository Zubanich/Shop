class CardsController < ApplicationController
  check_user
  check_order

  def show
    @line_items = current_order.line_items.includes(:product)
    @summ = @line_items.any? ? @line_items.map{|l| l.product.price }.sum : 0
  end
end
