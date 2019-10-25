class Homework < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :class_group


  validates :title, presence: true
  validates :date, presence: true
  validates :score, numericality: { only_integer: true }

  def build_comments
    students = self.class_group.students
    students.sort_by(&:last_name).each do |student|
      comment = Comment.new({:homework_id => self.id, :student_id => student.id, :result => "0"})
      comment.save
    end

  end

end
