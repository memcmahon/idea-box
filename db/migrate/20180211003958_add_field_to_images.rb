class AddFieldToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :alt_tag, :string
  end
end
