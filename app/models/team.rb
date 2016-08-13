class Team < ApplicationRecord
  validates :team_name, presence: true
  validates :participants, length: { in: 1..6 }

  scope :todays_teams, -> { where('created_at >= ?', Date.today) }
  scope :todays_participants, -> { pluck(:participants)}
end
