class AddImageToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :image, :string
  end
end
