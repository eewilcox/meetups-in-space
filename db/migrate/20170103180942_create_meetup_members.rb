class CreateMeetupMembers < ActiveRecord::Migration
  def change
    create_table :meetups_members do |table|
      table.integer :user_id, null: false
      #could also have done table.belongs_to :users, null: false
      table.integer :meetup_id, null: false
      #could also have done table.belongs_to :meetups, null false
    end
  end
end
