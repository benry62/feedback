class Comment < ApplicationRecord
  belongs_to :student
  belongs_to :homework

  has_many :presentations, dependent: :destroy
  has_many :presentation_items, through: :presentations

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


end
