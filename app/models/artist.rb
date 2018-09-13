class Artist < ApplicationRecord
  belongs_to :category
  has_many :album, dependent: :destroy
  has_many :song, dependent: :destroy
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
  validates :description, presence: true
  validates :name, presence: true
  validates :avatar, presence: true
  validates :category_id, presence: true, length: {maximum: Settings.length_name}
end
