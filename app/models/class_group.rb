class ClassGroup < ApplicationRecord

  has_many :students, dependent: :destroy
  has_many :homeworks, dependent: :destroy


  def get_scores(homework)
    comments = Comment.where("homework_id = ?", homework.id)
    scores = Hash.new
    comments.each do |comment|
      scores.store(comment.student_id, comment.result)
    end
    scores
  end


end
