require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @team_one = Team.create!(team_name: 'Test', participants: ['fred'])
    @team_two = Team.create!(team_name: '123', participants: ['kazoo', 'bam bam',
                         'pebbles', 'wilma', 'betty', 'barney'])

    @user = User.create!(username: 'me', email: 'teamscontrollertest@example.com', password: 'password')
  end
  test "should get index" do
    sign_in @user
    get teams_path
    assert_response :success
    assert_select "aside#team_#{@team_one.id}"
    assert_select "a[href=?]", join_team_path(@team_one)
    team = Team.find_by(team_name: '123').id
    assert_select "aside#team_#{team}" do
      assert_select 'a', 0
    end
  end

  test 'maximum 6 participants per team' do
    sign_in @user
    get teams_path
    assert_difference("@team_two.participants.count", 0) do
      assert_select "aside#team_#{@team_two.id}" do
       patch join_team_path(@team_two.id), params: { team: {participants: @user.username } }, xhr: true
      end
    end
  end

  test 'Join Team Button Removed When User Joins Team' do
    sign_in @user
    get teams_path
    patch join_team_path(@team_one.id), params: { team: {participants: @user.username } }, xhr: true
    @team_one.reload
    assert_select 'a', 0
  end
end
