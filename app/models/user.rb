class User < ApplicationRecord
  require 'jwt'

  belongs_to :organization
  # validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_many :orders, dependent: :nullify
  passwordless_with :email

  encrypts :email, :name
end
