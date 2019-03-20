class RemoveStudentCourseColumnFromAttendances < ActiveRecord::Migration[5.2]
  def change
    remove_reference :attendances, :student_course, foreign_key: true
  end
end
