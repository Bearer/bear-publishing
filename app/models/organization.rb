class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :payment_accounts, dependent: :destroy
end
