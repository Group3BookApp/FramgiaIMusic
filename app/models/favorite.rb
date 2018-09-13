class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :song
  has_many :comments
  has_many :rates
  validates :song_id, presence: true, length: {maximum: Settings.length_name}
end
