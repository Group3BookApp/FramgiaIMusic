class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy
  scope :by_name_artist, -> {order :name}
  scope :by_order, -> {order created_at: :desc}
  scope :by_select_artist, -> {
    select :id, :name, :avatar, :description
  }
  mount_uploader :avatar, PictureUploader
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :description, presence: true,
    length: {maximum: Settings.length_description}
end
