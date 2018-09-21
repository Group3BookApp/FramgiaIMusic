class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :destroy
  scope :by_name_album, -> {order :name}
  validates :artist_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :description, length: {maximum: Settings.length_description}
end
