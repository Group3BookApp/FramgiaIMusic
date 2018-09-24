class Category < ApplicationRecord
  has_many :songs, dependent: :destroy
  scope :by_name_cate, -> {order :name}
  scope :by_order, -> {order created_at: :desc}
  scope :by_select_category, -> {
    select :id, :name, :description
  }
  validates :name, presence: true, length: {maximum: Settings.length_name}
  validates :description, length: {maximum: Settings.length_description}
end
