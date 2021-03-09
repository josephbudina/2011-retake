class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @team = @competition.teams.new(team_params)
    if @team.valid?
      @team = @competition.teams.create(team_params)
      redirect_to competition_path(@competition)
    else
      flash[:notice] = "Fields Missing: Fill in all fields"

      redirect_to new_competition_team_path(@competition)
    end
  end

  private
  def team_params
    params.permit(:nickname, :hometown)
  end
end