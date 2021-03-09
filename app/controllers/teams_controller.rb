class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @team = @competition.teams.create(team_params)
    redirect_to competition_path(@competition)
  end

  private
  def team_params
    params.permit(:nickname, :hometown)
  end
end