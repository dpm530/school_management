class RemoveColumnSenderIdFromTeacherParentMessage < ActiveRecord::Migration[5.2]
  def change
     remove_column :teacher_parent_messages, :sender_id
  end
end
