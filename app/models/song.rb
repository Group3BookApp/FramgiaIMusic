class Song < ApplicationRecord
  scope :by_order, -> {order created_at: :desc}
  scope :select_song, -> {
    select :id, :avatar, :name, :data
  }
  mount_uploader :avatar, PictureUploader
  mount_uploader :data, AudioUploader
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :data, presence: true
end
