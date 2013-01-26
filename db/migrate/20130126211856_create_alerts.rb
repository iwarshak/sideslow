class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.text :alert
      t.integer :school_id

      t.timestamps
    end
  end
end
