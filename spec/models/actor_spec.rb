require 'rails_helper'

RSpec.describe Actor do
  before(:each) do
    @actor1 = Actor.create(name: 'Luke Skywalker', age: 28, currently_working: true)
    @actor2 = Actor.create(name: 'Princess Leah', age: 29, currently_working: false)
    @actor3 = Actor.create(name: 'Emma Watson', age: 24, currently_working: true)
    @actor4 = Actor.create(name: 'Rupert Grint', age: 25, currently_working: false)
    @actor5 = Actor.create(name: 'Daniel Radcliffe', age: 23, currently_working: true)
  end

  describe 'relationships' do
    it {should have_many :actor_movies}
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe 'class methods' do
    describe '#order_by_age' do
      it 'should order all actors by age, oldest to youngest' do
        expect(Actor.order_by_age).to eq([@actor2, @actor1, @actor4, @actor3, @actor5])
      end
    end
    describe '#currently_working' do
      it 'should return only actors that are currently working' do
        expect(Actor.currently_working).to eq([@actor1, @actor3, @actor5])
      end
    end
  end
end
