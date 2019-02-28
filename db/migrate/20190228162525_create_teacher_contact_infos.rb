class CreateTeacherContactInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_contact_infos do |t|
      t.string :line_1_address
      t.string :line_2_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :mobile_number
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
