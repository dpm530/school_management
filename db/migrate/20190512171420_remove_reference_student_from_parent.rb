class RemoveReferenceStudentFromParent < ActiveRecord::Migration[5.2]
  def change
     remove_reference :parents, :student, foreign_key: true
  end
end
