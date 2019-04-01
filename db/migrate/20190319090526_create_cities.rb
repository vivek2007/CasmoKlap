class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.text :description
      t.string :short_name

      t.timestamps
    end
  end
end
