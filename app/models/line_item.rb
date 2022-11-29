class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :book


  def total_price
    book.price * quantity
  end
end
