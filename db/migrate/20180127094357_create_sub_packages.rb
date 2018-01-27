class CreateSubPackages < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_packages do |t|
      t.string :name
      t.integer :package_id

      t.timestamps
    end
  end
end
