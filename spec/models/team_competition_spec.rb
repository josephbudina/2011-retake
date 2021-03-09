require 'rails_helper'
describe TeamCompetition, type: :model do 
  describe 'Relationships' do
    it { should belong_to :team }
    it { should belong_to :competition }
  end
end