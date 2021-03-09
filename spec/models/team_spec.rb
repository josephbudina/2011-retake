require 'rails_helper'
describe Team, type: :model do 
  describe 'Relationships' do
    it { should have_many :players }
    it { should have_many :team_competitions }
    it { should have_many(:competitions).through(:team_competitions) }
  end
end