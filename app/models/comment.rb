class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :homework

  has_many :presentations
  has_many :presentation_items, through: :presentations
  
end
