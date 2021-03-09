require 'rails_helper'
describe Player, type: :model do 
  describe 'Relationships' do
    it { should belong_to :team }
  end
end