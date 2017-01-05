class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :name, null: false
      table.string :description, null: false
      table.string :location, null: false
      table.integer :creator_id, null: false

      table.timestamps null: false
    end

    add_index :meetups, [:name], unique: true
  end
end
