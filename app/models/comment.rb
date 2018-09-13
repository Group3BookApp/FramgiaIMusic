class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song
  belongs_to :favorite
  validates :song_id, presence: true, length: {maximum: Settings.length_name}
  validates :favorite_id, presence: true, length: {maximum: Settings.length_name}
  validates :content, presence: true, length: {maximum: Settings.length_name}
end
