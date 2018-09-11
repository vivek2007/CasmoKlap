class AddLastStepToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :last_step, :string
  end
end
