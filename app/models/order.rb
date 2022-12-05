class Order < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :payment_account, optional: true
  enum status: {
    pending: 0,
    placed: 1,
    processed: 2
  }
  has_many :line_items, dependent: :destroy
  has_many :books, through: :line_items
  validates :payment_account, presence: true, if: -> { placed? || processed? }

  def total_price
    line_items.map(&:total_price).sum
  end

  def empty?
    line_items.none?
  end
end
