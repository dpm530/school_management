class CreateTeacherParentConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_parent_conversations do |t|
      t.references :parent, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
