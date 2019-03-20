class Course < ApplicationRecord
   has_many :teacher_courses, dependent: :destroy
   has_many :teachers, through: :teacher_courses
   has_many :student_courses, dependent: :destroy
   has_many :students, through: :student_courses
   has_many :attendances, dependent: :destroy

   validates :name, :subject, :start_date, :end_date, presence: true




end
