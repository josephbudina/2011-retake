require 'rails_helper'
describe 'Competition New Page' do
  it 'Registers New Team' do
    @regional = Competition.create(name: "Regional", location: "Chicago", sport: "ball sport")
    @cats = @regional.teams.create(hometown: "meowtown", nickname: "Cats")
    @dogs = @regional.teams.create(hometown: "barkburg", nickname: "Dogs")
    @doug = @cats.players.create(name: "Doug", age: 22)
    @katy = @cats.players.create(name: "Katy", age: 23)
    @andrew = @cats.players.create(name: "Andrew", age: 24)
    visit new_competition_team_path(@regional)
    save_and_open_page
    fill_in 'Nickname', with: 'Birds'
    fill_in 'Hometown', with: 'Sky'

    click_on 'Submit'
    expect(current_path).to eq(competition_path(@regional))
    expect(page).to have_content("Birds")
    expect(page).to have_content("Sky")
  end
end