require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @team = Team.create!(team_name: 'Test', participants: ['fred'])
    @team = Team.create!(team_name: '123', participants: ['kazoo', 'bam bam',
                         'pebbles', 'wilma', 'betty', 'barney'])
  end
  test "should get index" do
    get teams_path
    assert_response :success
    assert_select 'aside#team_1'
    assert_select "a[href=?]", new_team_path
    team = Team.find_by(team_name: '123').id
    assert_select "aside#team_#{team}" do
      assert_select 'a', 0
    end
  end

end
