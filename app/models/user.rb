class User < ActiveRecord::Base
  has_many :events
  has_many :invitations, foreign_key: :user_id
  has_many :attended_events, through: :invitations
end


