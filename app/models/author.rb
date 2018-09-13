class Author < ApplicationRecord
  validates :name, presence: true
  validates :avatar, presence: true
  has_many :song, dependent: :destroy
end
