class MeetupsMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :meetup

  validates :user, presence: true
  validates :meetup, presence: true
  validates :user, uniqueness: {scope: :meetup}
end
