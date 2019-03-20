class AddPresentcolumnToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :present, :boolean
  end
end
