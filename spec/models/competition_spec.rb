require 'rails_helper'
describe Competition, type: :model do 
  describe 'Relationships' do
    it { should have_many :team_competitions }
    it { should have_many(:teams).through(:team_competitions) }
  end

  describe 'Instance Methods' do
    it '#average_players_age' do
    @regional = Competition.create(name: "Regional", location: "Chicago", sport: "ball sport")
    @cats = @regional.teams.create(hometown: "meowtown", nickname: "Cats")
    @dogs = @regional.teams.create(hometown: "barkburg", nickname: "Dogs")
    @doug = @cats.players.create(name: "Doug", age: 22)
    @katy = @cats.players.create(name: "Katy", age: 23)
    @andrew = @dogs.players.create(name: "Andrew", age: 24)

      expect(@regional.average_players_age).to eq(23.0)
    end
  end
end