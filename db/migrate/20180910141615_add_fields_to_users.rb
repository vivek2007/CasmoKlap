class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone, :bigint
    add_column :users, :category_id, :integer
    add_column :users, :city, :string
  end
end
