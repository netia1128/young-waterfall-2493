require 'rails_helper'

RSpec.describe 'studios show page', type: :feature do
  before(:each) do
    @studio1 = Studio.create(name: 'Paramount Theaters', location: 'Los Angeles')
    @studio2 = Studio.create(name: 'Sundance', location: 'Park City')
    @movie1 = @studio1.movies.create(title: 'Star Wars', creation_year: 1995, genre: 'Science Fiction')
    @movie2 = @studio1.movies.create(title: 'Harry Potter', creation_year: 2000, genre: 'Fantasy')
    @movie3 = @studio2.movies.create(title: 'Wizard of Oz', creation_year: 1946, genre: 'Drama')
    @movie4 = @studio2.movies.create(title: 'Titanic', creation_year: 1998, genre: 'Drama')
    @actor1 = Actor.create(name: 'Luke Skywalker', age: 28, currently_working: true)
    @actor2 = Actor.create(name: 'Princess Leah', age: 29, currently_working: false)
    @actor3 = Actor.create(name: 'Emma Watson', age: 24, currently_working: true)
    @actor4 = Actor.create(name: 'Rupert Grint', age: 25, currently_working: false)
    @actor5 = Actor.create(name: 'Daniel Radcliffe', age: 23, currently_working: true)
    @actor_movie1 = ActorMovie.create(actor: @actor1, movie: @movie1)
    @actor_movie2 = ActorMovie.create(actor: @actor2, movie: @movie1)
    @actor_movie3 = ActorMovie.create(actor: @actor3, movie: @movie2)
    @actor_movie4 = ActorMovie.create(actor: @actor4, movie: @movie2)
    @actor_movie5 = ActorMovie.create(actor: @actor5, movie: @movie2)
    @actor_movie5 = ActorMovie.create(actor: @actor5, movie: @movie1)
  end

  describe 'page appearance' do
    it 'contains the studios name, location, and movies list' do
      visit "/studios/#{@studio1.id}"

      expect(page).to have_content("Name")
      expect(page).to have_content("Paramount Theaters")
      expect(page).to have_content("Location")
      expect(page).to have_content("Los Angeles")
      expect(page).to have_content("Movies")
      expect(page).to have_content("Star Wars")
      expect(page).to have_content("Harry Potter")
    end
    it 'contains currently working actors appearing in any of its movies ordered by age' do
      visit "/studios/#{@studio1.id}"

      expect(page).to have_content("Actors")
      expect(@actor1.name).to appear_before(@actor3.name)
      expect(@actor3.name).to appear_before(@actor5.name)

    end
  end

  describe 'page functionality' do
  end
end