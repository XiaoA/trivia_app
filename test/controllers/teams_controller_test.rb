require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @team = Team.create!(team_name: 'Test', participants: ['fred'])
  end
  test "should get index" do
    get teams_path
    assert_response :success
    assert_select 'div#team_1'
    assert_select "a[href=?]", new_team_path
  end

end
