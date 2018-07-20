class ClassGroup < ApplicationRecord

  has_many :students
  has_many :homeworks
end
