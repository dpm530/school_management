class ChangeStudentsContactInfo < ActiveRecord::Migration[5.2]
   def change
      change_column :student_contact_infos, :mobile_number, :string
   end
end
