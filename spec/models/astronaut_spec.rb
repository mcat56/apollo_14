require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'attributes' do
    it 'has attributes' do
      mission_1 = Mission.create!(title: 'Apollo', time_in_space: 364)
      neil_arm = mission_1.astronauts.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')

      expect(neil_arm.name).to eq('Neil Armstrong')
      expect(neil_arm.age).to eq(37)
      expect(neil_arm.job).to eq('Commander')
    end
  end

  describe 'class methods' do

  end

end
