class Category < ApplicationRecord
  has_many :songs, dependent: :destroy
  scope :by_name_cate, -> {order :name}
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :description, presence: true,
  length: {maximum: Settings.length_description}
end
