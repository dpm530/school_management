class AddStudentCourseRefToGradebook < ActiveRecord::Migration[5.2]
  def change
    add_reference :gradebooks, :student_course, foreign_key: true
  end
end
