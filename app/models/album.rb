class Album < ApplicationRecord
	has_many :song
	belongs_to :artist
  validates :description, presence: true
  validates :name, presence: true
  validates :avatar, presence: true
  scope :by_order, -> {order created_at: :desc}
  scope :by_select_album, -> {
    select :id, :name, :avatar, :description, :artist_id
  }
end
