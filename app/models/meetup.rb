class Meetup < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :users, through: :meetups_members
  has_many :meetups_members
end
