class Tag < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { maximum: 10 }
  
  belongs_to :user
  has_many :todos
end
