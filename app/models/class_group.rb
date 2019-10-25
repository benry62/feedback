class ClassGroup < ApplicationRecord

  has_many :students, dependent: :destroy
  has_many :homeworks, dependent: :destroy


  def get_scores(homework)

    comments = Comment.where("homework_id = ? ", homework.id)
    scores = Hash.new
    comments.each do |comment|
      attributes = {:result => comment.result, :is_merit => comment.merit, :is_resubmit => comment.resubmit}
      scores.store(comment.student_id, attributes)
    end
    scores
  end


  def count_students
      count = Student.where("class_group_id = ? AND is_current = ?", self.id, true).count
  end


  def set_colour(homework, result)
    total_score = homework.score
    if result.to_f/total_score.to_f > 0.85
      css_class = "merit"
    elsif result.to_f/total_score.to_f < 0.49
      css_class = "resubmit"
    else
      css_class = 'amber'
    end
    css_class
  end

end
