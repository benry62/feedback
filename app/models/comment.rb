class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :homework

  has_many :presentations, dependent: :destroy
  has_many :presentation_items, through: :presentations
  has_one :note, dependent: :destroy
  validates :result, numericality: { only_integer: true }
  accepts_nested_attributes_for :note


  def addclass
    if resubmit
      css_class = 'resubmit'
    elsif merit
      css_class = "merit"
    else
      css_class = ''
    end
    css_class
  end

  def calculate_class (total_score)
    if result == -1
      css_class = "amber"
    elsif result.to_f/total_score.to_f > 0.85
      css_class = "merit"
    elsif result.to_f/total_score.to_f < 0.49
      self.resubmit = true
      css_class = "resubmit"
    else
      css_class = ''
    end
    self.save
    css_class
  end

  def set_flag(flag)
    if flag
      student = Student.find(self.student_id)
      student.flag = true
      student.save
    end
  end

  def set_not_submitted


  end




end
