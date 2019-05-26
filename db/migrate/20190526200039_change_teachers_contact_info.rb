class ChangeTeachersContactInfo < ActiveRecord::Migration[5.2]
  def change
     change_column :teacher_contact_infos, :mobile_number, :string
  end
end
