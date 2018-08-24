require 'rails_helper'

describe 'when visiting astronaut index page' do
  describe 'as a visitor' do
    before (:each) do
      @astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
      @astronaut_2 = Astronaut.create(name: 'Bill Bills', age: 39, job: 'Pilot')
      @astronaut_3 = Astronaut.create(name: 'Dave Davies', age: 40, job: 'Engineer')
    end
    it 'should display the name of the astronaut' do
      visit '/astronauts'

      expect(page).to have_content("Name: #{@astronaut_1.name}")
      expect(page).to have_content("Name: #{@astronaut_2.name}")
    end
    it 'should display the age of the astronaut' do
      visit '/astronauts'

      expect(page).to have_content("Age: #{@astronaut_1.age}")
      expect(page).to have_content("Age: #{@astronaut_2.age}")
    end
    it 'should display the job of the astronaut' do
      visit '/astronauts'

      expect(page).to have_content("Job: #{@astronaut_1.job}")
      expect(page).to have_content("Job: #{@astronaut_2.job}")
    end
    it 'should display the average age of all Astronauts' do
      visit '/astronauts'

      expect(page).to have_content("Average Age: #{Astronaut.average_age}")
    end
    it 'should display the list of missions alphabetically for each Astronaut' do
      visit '/astronauts'

      expect(page).to have_content("Space Missions: #{@astronaut_1.space_missions}")
    end
  end
end
