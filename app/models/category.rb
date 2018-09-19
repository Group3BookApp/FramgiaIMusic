class Category < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :artists, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :description, presence: true,
  length: {maximum: Settings.length_description}
end
