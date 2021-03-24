class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :invitations
  has_many :guests, through: :invitations

  scope :past_events, -> { where("date < '#{Time.now}'") }
  scope :upcoming_events, -> { where("date >= '#{Time.now}'") }
end
