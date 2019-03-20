class RemoveStudentColumnFromAttendances < ActiveRecord::Migration[5.2]
  def change
    remove_reference :attendances, :student, foreign_key: true
  end
end
