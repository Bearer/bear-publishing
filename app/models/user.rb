class User < ApplicationRecord
  require 'jwt'

  belongs_to :organization
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_many :orders, dependent: :nullify
  passwordless_with :email

  def jwt_token
    JWT.encode(
      {
        id:,
        email:,
        organization_id: organization.id,
      },
      nil,
      'HS256'
    )
  end
end
