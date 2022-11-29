class OrdersController < ApplicationController
  before_action :require_user!

  def show
    @order = current_organization.orders.find_by(params[:id])
  end

  def current
    @order = current_order
  end

  def index
    @orders = current_organization.orders.not_pending
  end

  def add
    order = current_order
    order.save
    session[:current_order_id] = order.id

    book = Book.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    line_item = order.line_items.find_by(book_id: book.id)

    if line_item && quantity > 0
      line_item.update(quantity: )
    elsif quantity <= 0
      line_item.destroy
    else
      order.line_items.create(book: book, quantity:)
    end
  end

  def remove
    current_order.line_items.find_by(id: params[:id]).destroy
  end

  private
end