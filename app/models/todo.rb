class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :tag, optional: true
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: {maximum: 10 }
end
