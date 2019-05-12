class AddTeacherReferencesToTeacherParentMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :teacher_parent_messages, :teacher, foreign_key: true
  end
end
