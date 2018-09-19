class Song < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  belongs_to :album
  belongs_to :author
  scope :by_order, -> {order created_at: :desc}
  scope :select_song, -> {
    select :id, :avatar, :name, :data
  }
  mount_uploader :avatar, PictureUploader
  mount_uploader :data, AudioUploader
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :data, presence: true
  validates :category_id, presence: true, length: {maximum: Settings.length_name}
  validates :artist_id, presence: true, length: {maximum: Settings.length_name}
  validates :album_id, presence: true, length: {maximum: Settings.length_name}
  validates :author_id, presence: true, length: {maximum: Settings.length_name}
end
