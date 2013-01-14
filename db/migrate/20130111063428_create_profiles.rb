class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :type
      t.datetime :start_date
      t.datetime :end_date
      t.string :comment

      t.timestamps
    end
  end
end
