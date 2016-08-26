require 'test_helper'

class JoinTeamTest < ActionDispatch::IntegrationTest

  def setup
    @team_one = teams(:single_member)
    @team_two = teams(:max_players)
    @team_three = teams(:third_team)
    @user = users(:yml_user)
 end

 test 'User Joins Team' do
   sign_in @user
   get teams_path
   participants = @team_one.participants.count
   assert_select "aside#team_#{@team_one.id}" do
    patch join_team_path(@team_one.id), params: { team: { participants: @user.username } }, xhr: true
   end
   @team_one.reload
   assert_equal participants += 1, @team_one.participants.count
 end

 test 'User May Only Join Team Once' do
   sign_in @user
   get teams_path
   patch join_team_path(@team_one.id), params: { team: { participants: @user.username } }, xhr: true
   @team_one.reload
   get teams_path
   assert_difference("@team_one.participants.count", 0) do
     assert_select "aside#team_#{@team_one.id}" do
       patch join_team_path(@team_one.id), params: { team: { participants: @user.username } }, xhr: true
       @team_one.reload
     end
   end
 end

 test 'User May Only Join One Team' do
   sign_in @user
   get teams_path
   patch join_team_path(@team_one.id), params: { team: { participants: @user.username } }, xhr: true
   @team_one.reload
   get teams_path
   assert_difference("@team_three.participants.count", 0) do
     patch join_team_path(@team_three.id), params: { team: { participants: @user.username } }, xhr: true
     @team_three.reload
   end
 end
end
