class User < ApplicationRecord
  has_many :hosted_events, class_name: 'Event', foreign_key: 'host_id', dependent: :destroy
end
