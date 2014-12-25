class User < ActiveRecord::Base
  has_many :events
  has_many :invitations, foreign_key: :event_id
  has_many :attended_events, through: :invitations
end


