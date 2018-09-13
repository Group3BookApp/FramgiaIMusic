class Category < ApplicationRecord
  has_many :song, dependent: :destroy
  has_many :artist, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :description, presence: true
end