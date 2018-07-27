class PresentationItem < ApplicationRecord
  has_many :presentations
  has_many :comments, through: :presentations
end

def full_item
  "#{heading} #{category}"
end
