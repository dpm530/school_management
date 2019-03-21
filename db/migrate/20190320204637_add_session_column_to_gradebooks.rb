class AddSessionColumnToGradebooks < ActiveRecord::Migration[5.2]
  def change
    add_column :gradebooks, :session, :string
    add_column :gradebooks, :year, :string
    add_column :gradebooks, :start_date, :date
    add_column :gradebooks, :end_date, :date
  end
end
