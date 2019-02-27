class CreateCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates do |t|
      t.attachment :certificate_avatar
      t.integer :profile_id

      t.timestamps
    end
  end
end
