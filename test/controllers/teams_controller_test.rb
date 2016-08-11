require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teams_path
    assert_response :success
    assert_select "a[href=?]", new_team_path
  end

end
