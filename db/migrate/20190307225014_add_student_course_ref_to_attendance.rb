class AddStudentCourseRefToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :student_course, foreign_key: true
  end
end
