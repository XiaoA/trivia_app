class TeamsController < ApplicationController
  before_action :authenticate_user!
  def index
    @teams = Team.all
  end

  def join
    @team = Team.find(params[:id])
    @team.participants_will_change!
    @team.update(participants: @team.participants.push(current_user.username))
  end

  private
  def team_params
    params.require(:team).permit(:team_name, :participants)
  end
end
