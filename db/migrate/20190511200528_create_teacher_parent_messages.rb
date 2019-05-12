class CreateTeacherParentMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_parent_messages do |t|
      t.text :body
      t.references :teacher_parent_conversation, foreign_key: true
      t.boolean :read, :default => false
      t.integer :sender_id

      t.timestamps
    end
  end
end
