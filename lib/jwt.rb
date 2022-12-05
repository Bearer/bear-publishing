class JWT
  def self.token_for(user)
    JWT.encode(
      {
        id: user.id,
        email: user.email,
        class: user.class,
      },
      nil,
      'HS256'
    )
  end
end