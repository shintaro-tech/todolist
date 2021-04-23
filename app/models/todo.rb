class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  
  validates :content, presence: true, length: { maximum: 255 }
end
