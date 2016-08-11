require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = Team.new(team_name: 'KnowItAlls', participants: ['fred', 'barney',
                     'wilma', 'betty', 'bam bam', 'pebbles'])
  end

  test 'valid team' do
    assert @team.valid?
  end

  test 'team participants > 6 invalid' do
    @team.participants << 'kazoo'
    assert_not @team.valid?
  end

  test 'empty team invalid' do
    @team.participants = []
    assert_not @team.valid?
  end

  test 'one member team valid' do
    @team.participants = ['fred']
    assert @team.valid?
  end

  test 'empty team name invalid' do
    @team.team_name = '   '
    assert_not @team.valid?
  end
end
