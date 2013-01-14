class AddLeaveTypeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :leave_type, :string
  end
end
