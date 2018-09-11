class CreateReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :references do |t|
      t.string :name
      t.bigint :contact
      t.integer :profile_id

      t.timestamps
    end
  end
end
