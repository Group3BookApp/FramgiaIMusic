class Song < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  belongs_to :album
  belongs_to :author
  scope :by_order, -> {order created_at: :desc}
  scope :select_song, -> {
    select :id, :avatar, :name, :data, :listening
  }
  mount_uploader :avatar, PictureUploader
  mount_uploader :data, AudioUploader
  validates :artist_id, presence: true
  validates :album_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :category_id, presence: true, length: {maximum: Settings.length_name}
  validates :author_id, presence: true, length: {maximum: Settings.length_name}
end
