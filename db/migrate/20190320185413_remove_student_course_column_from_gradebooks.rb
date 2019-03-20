class RemoveStudentCourseColumnFromGradebooks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :gradebooks, :student_course, foreign_key: true
  end
end
