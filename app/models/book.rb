class Book < ApplicationRecord
  belongs_to :author

  def image
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(title+id.to_s)}?s=100&d=identicon"
  end
end
