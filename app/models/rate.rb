class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :song
  belongs_to :favorite
  validates :song_id, presence: true, length: {maximum: Settings.length_name}
  validates :favorite_id, presence: true, length: {maximum: Settings.length_name}
  validates :num_rate, presence: true, length: {maximum: Settings.length_name}
  validates :avg_rate, presence: true, length: {maximum: Settings.length_name}
end
