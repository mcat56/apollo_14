require 'rails_helper'

describe 'As a visitor' do
  before(:each) do
    mission_1 = Mission.create!(title: 'Apollo', time_in_space: 364)
    mission_2 = Mission.create!(title: 'Gemini', time_in_space: 597)
    mission_3 = Mission.create!(title: 'Artemis', time_in_space: 456)

    @neil_arm = Astronaut.create!(name: 'Neil Armstrong', age: 37, job: 'Commander')
    @sally_ride = Astronaut.create!(name: 'Sally Ride', age: 42, job: 'Chief Commander')
    @alan_shepard = Astronaut.create!(name: 'Alan Shepard', age: 39, job: 'Pilot')
    @pete_con = Astronaut.create!(name: 'Pete Conrad', age: 47, job: 'Captain')

    neil_1 = AstronautMission.create!(mission_id: mission_1.id, astronaut_id: @neil_arm.id)
    neil_2 = AstronautMission.create!(mission_id: mission_2.id, astronaut_id: @neil_arm.id)
    sally_1 = AstronautMission.create!(mission_id: mission_1.id, astronaut_id: @sally_ride.id)
    sally_2 = AstronautMission.create!(mission_id: mission_3.id, astronaut_id: @sally_ride.id)
    alan_1 = AstronautMission.create!(mission_id: mission_2.id, astronaut_id: @alan_shepard.id)
    alan_2 = AstronautMission.create!(mission_id: mission_1.id, astronaut_id: @alan_shepard.id)
    pete_1 =AstronautMission.create!(mission_id: mission_3.id, astronaut_id: @pete_con.id)
    pete_2 = AstronautMission.create!(mission_id: mission_1.id,astronaut_id: @pete_con.id)

  end
  it 'I see all astronauts and their information on the index page' do
    visit '/astronauts'
    within "#astronaut-#{@neil_arm.id}" do
      expect(page).to have_content('Neil Armstrong')
      expect(page).to have_content(37)
      expect(page).to have_content('Commander')
    end
    within "#astronaut-#{@sally_ride.id}" do
      expect(page).to have_content('Sally Ride')
      expect(page).to have_content(42)
      expect(page).to have_content('Chief Commander')
    end
    within "#astronaut-#{@alan_shepard.id}" do
      expect(page).to have_content('Alan Shepard')
      expect(page).to have_content(39)
      expect(page).to have_content('Pilot')
    end
    within "#astronaut-#{@pete_con.id}" do
      expect(page).to have_content('Pete Conrad')
      expect(page).to have_content(47)
      expect(page).to have_content('Captain')
    end
  end

  it 'displays the average age of all astronauts' do
    visit 'astronauts'
    save_and_open_page

    expect(page).to have_content('Average Astronaut Age: 41')
  end

end
