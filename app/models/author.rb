class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def image
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(name+id.to_s)}?s=100&d=monsterid"
  end
end
