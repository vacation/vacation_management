class AddIsApprovedToUser < ActiveRecord::Migration
  def change
    add_column :users, :isApproved, :string
  end
end
