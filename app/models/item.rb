class Item < ApplicationRecord
  belongs_to :board
  validates :x, :y, :width, :height, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :link, presence: true
end
