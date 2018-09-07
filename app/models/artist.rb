class Artist < ApplicationRecord
  validates :description, presence: true
  validates :name, presence: true
  validates :avatar, presence: true
end
