class ChangeAttendancesColumnDefaultToTrue < ActiveRecord::Migration[5.2]
  def change
     change_column_default :attendances, :present, default: true
  end
end
