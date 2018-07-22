class PresentationItem < ApplicationRecord
  has_many :comments, through: :presentation
end
