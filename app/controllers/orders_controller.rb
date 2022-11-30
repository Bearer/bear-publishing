class OrdersController < ApplicationController
  include ActionView::RecordIdentifier

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

    line_item = order.line_items.find_or_create_by(book_id: book.id) do |item|
      item.quantity = 1
    end

    if params[:quantity].present?
      quantity = params[:quantity].to_i
      if quantity > 0
        line_item.update(quantity:)
      else
        line_item.destroy
      end
    end



    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(dom_id(order), partial: "orders/order", locals: { order: }),
          turbo_stream.replace("basket_count", partial: "basket_count"),
          turbo_stream.replace(dom_id(book), partial: "books/book", locals: {book:}),
        ]
      end
    end
  end

  def remove
    current_order.line_items.find_by(id: params[:id]).destroy
  end

  private
end