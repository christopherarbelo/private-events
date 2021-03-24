class User < ApplicationRecord
  has_many :hosted_events, class_name: 'Event', foreign_key: 'host_id', dependent: :destroy
  has_many :invitations, foreign_key: 'guest_id'
  has_many :invited_events, through: :invitations, source: :event
end
