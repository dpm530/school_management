class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
