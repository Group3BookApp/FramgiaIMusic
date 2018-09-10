class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable,
    :omniauthable, :omniauth_providers => [:google_oauth2]

  mount_uploader :avatar, PictureUploader

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end
end
