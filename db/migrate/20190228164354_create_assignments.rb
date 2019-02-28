class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.text :description
      t.date :due_date
      t.date :date_assigned
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
