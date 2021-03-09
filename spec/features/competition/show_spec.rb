require 'rails_helper'
describe 'Competition Show Page' do
  it 'has that comps attributes' do
    @regional = Competition.create(name: "Regional", location: "Chicago", sport: "ball sport")
    visit competition_path(@regional)

    expect(page).to have_content("Regional")
    expect(page).to have_content("Chicago")
    expect(page).to have_content("ball sport")
  end

  it 'Lists attributes of all teams in comp' do
    @regional = Competition.create(name: "Regional", location: "Chicago", sport: "ball sport")
    @cats = @regional.teams.create(hometown: "meowtown", nickname: "Cats")
    @dogs = @regional.teams.create(hometown: "barkburg", nickname: "Dogs")
    visit competition_path(@regional)

    expect(page).to have_content("meowtown")
    expect(page).to have_content("Cats")
    expect(page).to have_content("barkburg")
    expect(page).to have_content("Dogs")
  end

  it 'lists average age of players' do
    @regional = Competition.create(name: "Regional", location: "Chicago", sport: "ball sport")
    @cats = @regional.teams.create(hometown: "meowtown", nickname: "Cats")
    @dogs = @regional.teams.create(hometown: "barkburg", nickname: "Dogs")
    @doug = @cats.players.create(name: "Doug", age: 22)
    @katy = @cats.players.create(name: "Katy", age: 23)
    @andrew = @cats.players.create(name: "Andrew", age: 24)
    visit competition_path(@regional)

    within('#average_player_age') do
      expect(page).to have_content('23')
    end
  end
end