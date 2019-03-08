class AddStudentCourseColumnToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :student_course, foreign_key: true
  end
end
