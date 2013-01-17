class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :isApproved, :is_approved
  end
end
