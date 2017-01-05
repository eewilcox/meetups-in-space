class Meetup < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :users, through: :meetups_members
  has_many :meetups_members

  validates :creator, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :location, presence: true

end
