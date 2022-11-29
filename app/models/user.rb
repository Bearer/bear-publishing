class User < ApplicationRecord
  belongs_to :organization
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_many :orders, dependent: :nullify
  passwordless_with :email
end
