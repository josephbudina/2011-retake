class Competition < ApplicationRecord
  has_many :team_competitions
  has_many :teams, through: :team_competitions

  def average_players_age
    teams.joins(:players).average('players.age')
  end
end