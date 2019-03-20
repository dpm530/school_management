class RemoveStudentColumnFromAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :assignments, :student, foreign_key: true
  end
end
