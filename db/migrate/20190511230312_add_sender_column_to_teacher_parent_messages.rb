class AddSenderColumnToTeacherParentMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_parent_messages, :sender, :string
  end
end
