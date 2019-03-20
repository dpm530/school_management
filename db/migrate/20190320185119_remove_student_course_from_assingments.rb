class RemoveStudentCourseFromAssingments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :assignments, :student_course, foreign_key: true
  end
end
