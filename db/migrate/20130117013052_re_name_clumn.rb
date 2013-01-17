class ReNameClumn < ActiveRecord::Migration
  def change
    rename_column :users, :is_approved, :approved
  end
end
