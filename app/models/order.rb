class Order < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  enum status: {
    pending: 0,
    placed: 1,
    processed: 2
  }
  has_many :line_items, dependent: :destroy
  has_many :books, through: :line_items

  def total_price
    line_items.map(&:total_price).sum
  end
end
