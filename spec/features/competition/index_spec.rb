require 'rails_helper'
describe 'Competition Index Page' do
  it 'Lists comp names as links to show page' do
    @regional = Competition.create(name: "Regional", location: "Chicago", sport: "ball sport")
    @state = Competition.create(name: "State", location: "London", sport: "ball sport")
    visit competitions_path

    within "#comp_id-#{@regional.id}" do
      expect(page).to have_link('Regional')
      click_link 'Regional'
      expect(current_path).to eq(competition_path(@regional))
    end

    visit competitions_path
    within "#comp_id-#{@state.id}" do
      expect(page).to have_link('State')
    end
  end
end