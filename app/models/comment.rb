class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :homework

  has_many :presentations, dependent: :destroy
  has_many :presentation_items, through: :presentations

end
