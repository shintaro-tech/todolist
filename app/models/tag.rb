class Tag < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  
  belongs_to :user
  has_many :todos
end
