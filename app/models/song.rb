class Song < ApplicationRecord
  belongs_to :album
  has_many :artists
  scope :by_order, -> {order created_at: :desc}
  scope :select_song, -> {
    select :id, :avatar, :name, :data, :listening
  }
  mount_uploader :avatar, PictureUploader
  mount_uploader :data, AudioUploader
  validates :artist_id, presence: true
  validates :album_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :data, presence: true
  validates :listening, presence: true, numericality: true

  def increase_listening
    self.listening += 1
    self.save!
  end
end
