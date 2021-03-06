class TeamsController < ApplicationController
  before_action :authenticate_user!
  def index
    @teams = Team.todays_teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @participants = Team.todays_teams.todays_participants
    respond_to do |format|
      unless @participants.flatten.include?(current_user.username)
        @team.participants.push(current_user.username)
        if @team.save
          flash[:notice] = 'New team created.'
          format.html { redirect_to teams_path }
          format.json { render json: @team }
        end
      else
        flash[:notice] = "#{current_user.username} has already created a team."
        format.html { redirect_to teams_path }
      end
    end
  end

  def join
    @team = Team.find(params[:id])
    @participants = Team.todays_teams.todays_participants
    unless @team.participants.include?(current_user.username) || @participants.flatten.include?(current_user.username)
      @team.participants_will_change!
      @team.update(participants: @team.participants.push(current_user.username))
      respond_to do |format|
        format.html { redirect_to teams_path }
        format.js
      end
    end
  end

  def leave
    @team = Team.find(params[:id])
    participants = @team.participants - [current_user.username]
    @team.participants_will_change!
    @team.update(participants: participants)
    respond_to do |format|
      format.html { redirect_to teams_path }
      format.js
    end
  end

  private
  def team_params
    params.require(:team).permit(:team_name, participants: [])
  end
end
