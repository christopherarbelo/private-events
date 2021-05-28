class Event < ApplicationRecord
  # associations
  belongs_to :host, class_name: 'User'
  has_many :invitations
  has_many :guests, through: :invitations

  accepts_nested_attributes_for :invitations
  scope :past_events, -> { where("date < '#{Time.now}'") }
  scope :upcoming_events, -> { where("date >= '#{Time.now}'") }
end
