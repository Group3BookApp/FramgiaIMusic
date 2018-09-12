class Lyric < ApplicationRecord
  belongs_to :song
  belongs_to :user
  scope :by_order, -> {order created_at: :desc}
  scope :by_select_lyric, -> {
    select :id, :content, :status
  }
  validates :content, presence: true, length: {maximum: 500}
  validates :status, presence: true, default: false
end
