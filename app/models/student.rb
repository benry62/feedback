class Student < ApplicationRecord

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :class_group_id, presence: true

  belongs_to :class_group
  has_many :comments
  has_many :notes


  def full_name
    "#{first_name} #{last_name}"
  end


end
