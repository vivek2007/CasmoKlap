class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :desc
      t.integer :parent_id

      t.timestamps
    end
  end
end
