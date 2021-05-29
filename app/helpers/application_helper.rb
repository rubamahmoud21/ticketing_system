module ApplicationHelper

  def encode(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def decode(token)
    JWT.decode(token, Rails.application.secret_key_base , true, algorithm: 'HS256')
  end

end
