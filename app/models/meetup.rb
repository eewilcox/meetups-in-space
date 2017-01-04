class Meetup < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :meetups_members
end
