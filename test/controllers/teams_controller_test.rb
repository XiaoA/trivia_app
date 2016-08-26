require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @team_one = teams(:single_member)
    @team_two = teams(:max_players)
    @user = users(:yml_user)
  end

  test 'should get index' do
    sign_in @user
    get teams_path
    assert_response :success
    assert_select "aside#team_#{@team_one.id}"
    assert_select 'a[href=?]', join_team_path(@team_one)
  end

  test 'maximum 6 participants per team' do
    sign_in @user
    get teams_path
    assert_difference('@team_two.participants.count', 0) do
      assert_select "aside#team_#{@team_two.id}" do
        patch join_team_path(@team_two.id), params: { team: { participants:
                                                      @user.username } }, xhr: true
      end
    end
  end

  test 'Join Team Button Removed When User Joins Team' do
    sign_in @user
    get teams_path
    patch join_team_path(@team_one.id), params: { team: { participants:
                                                  @user.username } }, xhr: true
    @team_one.reload
    assert_select 'a', 0
  end

  test 'Create A Team' do
    sign_in @user
    get new_team_path
    assert_response :success
    assert_difference('Team.count', 1) do
      post '/teams', params: { team: { team_name: 'Lil Rascals',
                                       participants: [@user.username] } }
    end
  end

  test 'User May Create Only One Team' do
    sign_in @user
    get new_team_path
    assert_response :success
    post '/teams', params: { team: { team_name: 'Lil Rascals',
                                     participants: [@user.username] } }
    assert_redirected_to @teams
    follow_redirect!
    assert_equal flash[:notice], 'New team created.'
    assert_difference('Team.count', 0) do
      get new_team_path
      assert_response :success
      post '/teams', params: { team: { team_name: 'A-Team',
                                       participants: [@user.username] } }
      assert_redirected_to @teams
      follow_redirect!
      assert_equal flash[:notice], "#{@user.username} has already created a team."
    end
  end
end
