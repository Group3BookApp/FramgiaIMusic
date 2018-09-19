class Artist < ApplicationRecord
  validates :description, presence: true
  validates :name, presence: true
  #mount_uploader :avatar, PictureUploader
  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy
  #belongs_to :category
  scope :by_order, -> {order created_at: :desc}
  scope :by_select_artist, -> {
    select :id, :name, :avatar, :description
  }
  scope :search_artist, -> (search){
    where("name LIKE ?", "%#{search}%")
  }
  scope :filter_artist, -> (filter){
    where("name LIKE ?", "%#{filter}%")
  }
end
