class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :id_type
      t.string :name_on_id
      t.bigint :id_number
      t.attachment :id_front_image
      t.attachment :id_back_image
      t.string :lane1
      t.string :lan2
      t.string :colony
      t.string :city
      t.string :state
      t.string :country
      t.string :declaration
      t.bigint :alternate_contact
      t.string :online_presence
      t.string :business_name
      t.float :price_per_session
      t.string :specialization
      t.text :localities
      t.text :introduction
      t.boolean :degree_available
      t.string :service_location
      t.attachment :avatar
      t.integer :user_id
      t.string :last_step
      t.integer :experience_in_years
      t.integer :experience_in_months

      t.timestamps
    end
  end
end
