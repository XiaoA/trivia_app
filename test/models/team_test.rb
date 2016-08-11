require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = Team.new(team_name: 'KnowItAlls', participants: ['fred', 'barney',
                     'wilma', 'betty', 'bam bam', 'pebbles'])
  end
end
