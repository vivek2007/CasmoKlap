class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :location
      t.string :address
      t.string :full_name
      t.datetime :serve_on
      t.string :contact_on
      t.string :email
      t.integer :sub_category_id
      t.integer :sent_to

      t.timestamps
    end
  end
end
