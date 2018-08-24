require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end
  describe 'Class Methods' do
    before (:each) do
      @astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 37, job: 'Commander')
      @astronaut_1 = Astronaut.create(name: 'Bill Bills', age: 39, job: 'Pilot')
      @astronaut_1 = Astronaut.create(name: 'Dave Davies', age: 40, job: 'Engineer')
    end
    it 'should average the age of all astroanuts' do
      avg = Astronaut.average_age

      expect(avg).to eq(38.67)
    end
  end
  describe Astronaut, type: :model do
    describe "relationships" do
      it {should have_many(:space_missions).through(:astronaut_space_missions)}
    end
  end
end
