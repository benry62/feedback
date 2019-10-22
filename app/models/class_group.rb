class ClassGroup < ApplicationRecord

  has_many :students
  has_many :homeworks


  def get_scores(homework)
    comments = Comments.where("homework_id = ?", homework.id)
    scores = Hash.new
    comments.each do |comment|
      scores.store!(comment.student_id, comment.score)
    end
    scores
  end


end
