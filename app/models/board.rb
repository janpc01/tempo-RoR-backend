class Board < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_many :items, dependent: :destroy
end
