class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :destroy
  validates :artist_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :description, length: {maximum: Settings.length_description}
end
