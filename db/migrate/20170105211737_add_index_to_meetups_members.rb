class AddIndexToMeetupsMembers < ActiveRecord::Migration
  def change
    add_index :meetups_members, [:user_id, :meetup_id], unique: true
  end
end
