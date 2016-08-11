require 'test_helper'

class JoinTeamTest < ActionDispatch::IntegrationTest

  def setup
    @team_one = Team.create!(team_name: 'Test', participants: ['fred'])
    @team_two = Team.create!(team_name: '123', participants: ['kazoo', 'bam bam',
                         'pebbles', 'wilma', 'betty', 'barney'])
    @user = User.create!(username: 'test_user', email: 'test_user@example.com', password: 'password')
 end

 test 'User Joins Team' do
   sign_in @user
   get teams_path
   participants = @team_one.participants.count
   assert_select "aside#team_#{@team_one.id}" do
    patch join_team_path(@team_one.id), params: { team: {participants: @user.username } }, xhr: true
   end
   @team_one.reload
   assert_equal participants += 1, @team_one.participants.count
 end
end
