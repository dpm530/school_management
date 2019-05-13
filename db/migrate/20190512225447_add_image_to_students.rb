class AddImageToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :image, :string
  end
end
