class AddVacationTimeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :hour, :decimal
    add_column :profiles, :minute, :decimal
  end
end
