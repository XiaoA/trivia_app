class Team < ApplicationRecord
  validates :team_name, presence: true
  validates :participants, length: { in: 1..6 }
end
