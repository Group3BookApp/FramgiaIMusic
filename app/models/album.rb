class Album < ApplicationRecord
  belongs_to :artist, optional: true
  has_many :songs, dependent: :destroy
  scope :by_name_album, -> {order :name}
  scope :by_order, -> {order created_at: :desc}
  scope :by_select_album, -> {
    select :id, :name, :avatar, :artist_id, :description
  }
  mount_uploader :avatar, PictureUploader
  validates :artist_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :description, length: {maximum: Settings.length_description}
end
