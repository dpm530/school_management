class AddCourseColumnToGradebooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :gradebooks, :course, foreign_key: true
  end
end
