class Homework < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :class_group
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :notes

  validates :title, presence: true
  validates :date, presence: true
  validates :score, numericality: { only_integer: true }

  def build_comments
    students = self.class_group.students
    students.sort_by(&:last_name).each do |student|
      comment = Comment.new({:homework_id => self.id, :student_id => student.id, :result => "-1"})
      comment.save
    end

  end

  def get_attribute(attribute)
      Comment.where("homework_id = ? AND #{attribute} = ?", self.id, true).includes(:student).order("students.last_name")
  end

  def pretty_boolean(bool)
    bool ? "&#10003;" : "&#10005;"
  end


end
