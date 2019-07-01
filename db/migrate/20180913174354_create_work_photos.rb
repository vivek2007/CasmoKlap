class CreateWorkPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :work_photos do |t|
      t.string :photo
      t.integer :profile_id

      t.timestamps
    end
  end
end
