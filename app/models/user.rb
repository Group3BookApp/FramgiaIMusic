class User < ApplicationRecord
  before_save :downcase_email
  validates :name, presence: true, length: {maximum: Settings.length_name}
  VALID_EMAIL_REGEX = Settings.email_regex
  validates :email, presence: true, length: {maximum: Settings.length_email}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  mount_uploader :avatar, PictureUploader
  validates :password, presence: true, length: {minimum: Settings.pw_min}, allow_nil: true
  has_secure_password
  scope :selected, -> {select :id, :name, :email}
  scope :ordered, -> {order created_at: :DESC}

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end

  private

  def downcase_email
    email.downcase!
  end
end
