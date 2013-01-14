class RemoveTypeFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :type
  end

  def down
    add_column :profiles, :leave_type, :string
  end
end
