class Song < ApplicationRecord
  belongs_to :album
  belongs_to :artist
  belongs_to :author
  belongs_to :category
  scope :by_order, -> {order created_at: :desc}
  scope :select_song, -> {
    select :id, :avatar, :name, :data, :listening, :album_id,
      :artist_id, :author_id, :category_id
  }
  mount_uploader :avatar, PictureUploader
  mount_uploader :data, AudioUploader
  validates :artist_id, presence: true
  validates :album_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :data, presence: true
  validates :listening, numericality: true
  validates :author_id, presence: true
  validates :category_id, presence: true

  def increase_listening
    self.listening ||= 0
    self.listening += 1
    self.save!
  end
end
