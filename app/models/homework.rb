class Homework < ApplicationRecord
  has_many :comments
  belongs_to :class_group


  validates :title, presence: true
  validates :date, presence: true

  accepts_nested_attributes_for :comments, :allow_destroy => true

end
