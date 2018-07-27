class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :homework

  has_many :presentations
  has_many :presentation_items, through: :presentations

  accepts_nested_attributes_for :presentations,  :allow_destroy => true
  accepts_nested_attributes_for :presentation_items,  :allow_destroy => true
  
end
