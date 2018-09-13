class Artist < ApplicationRecord
  belongs_to :category
  has_many :album, dependent: :destroy
  has_many :song, dependent: :destroy
  validates :description, presence: true
  validates :name, presence: true
  validates :avatar, presence: true
  validates :category_id, presence: true, length: {maximum: Settings.length_name}
  scope :by_order, -> {order created_at: :desc}
  scope :by_select_artist, -> {
    select :id, :name, :avatar, :description
  }
end
