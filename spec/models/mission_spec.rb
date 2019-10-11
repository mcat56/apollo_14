require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'attributes' do
    it 'has attributes' do
      mission_1 = Mission.create!(title: 'Apollo', time_in_space: 364)

      expect(mission_1.title).to eq('Apollo')
      expect(mission_1.time_in_space).to eq(364)
    end 
  end
end
