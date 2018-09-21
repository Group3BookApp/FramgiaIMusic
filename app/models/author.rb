class Author < ApplicationRecord
  has_many :songs, dependent: :destroy
  scope :by_name_author, -> {order :name}
end
