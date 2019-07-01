class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.integer :sub_category_id
      t.integer :sub_package_id
      t.integer :user_id
      t.integer :employee_id
      t.string :status

      t.timestamps
    end
  end
end
