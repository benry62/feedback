class Homework < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :class_group


  validates :title, presence: true
  validates :date, presence: true
  validates :score, numericality: { only_integer: true }



end
