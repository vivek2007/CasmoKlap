class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :name
      t.text   :description
      t.string :short_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :pincode
      t.string :landmark
      t.integer :city_id

      t.timestamps
    end
  end
end
