class CreateGradebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :gradebooks do |t|
      t.string :letter_score
      t.integer :number_score
      t.text :comment
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
