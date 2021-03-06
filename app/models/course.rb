class Course < ApplicationRecord
   has_many :teacher_courses, dependent: :destroy
   has_many :teachers, through: :teacher_courses, source: :teacher
   has_many :student_courses, dependent: :destroy
   has_many :students, through: :student_courses, source: :student
   has_many :attendances, dependent: :destroy
   has_many :assignments, dependent: :destroy
   has_many :gradebooks, dependent: :destroy
   has_many :student_grades, through: :gradebooks, source: :student

   validates :name, :subject, :start_date, :end_date, presence: true




end
