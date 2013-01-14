class AddTimeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :time, :string
  end
end
