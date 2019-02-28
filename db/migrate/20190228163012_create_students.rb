class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :grade_level
      t.references :parent, foreign_key: true

      t.timestamps
    end
  end
end
