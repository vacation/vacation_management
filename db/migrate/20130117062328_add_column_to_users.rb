class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_times, :int
    add_column :users, :employee_type, :string
  end
end
