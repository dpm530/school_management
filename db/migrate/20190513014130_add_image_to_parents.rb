class AddImageToParents < ActiveRecord::Migration[5.2]
  def change
    add_column :parents, :image, :string
  end
end
