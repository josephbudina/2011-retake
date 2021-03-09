require 'rails_helper'
describe Competition, type: :model do 
  describe 'Relationships' do
    it { should have_many :team_competitions }
    it { should have_many(:teams).through(:team_competitions) }
  end
end