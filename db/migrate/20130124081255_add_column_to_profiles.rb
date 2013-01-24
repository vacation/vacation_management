class AddColumnToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :approved, :string
  end
end
