require 'rails_helper'

RSpec.describe 'studios show page', type: :feature do
  before(:each) do
    @studio1 = Studio.create(name: 'Paramount Theaters', location: 'Los Angeles')
    @studio2 = Studio.create(name: 'Sundance', location: 'Park City')
    @movie1 = @studio1.movies.create(title: 'Star Wars', creation_year: 1995, genre: 'Science Fiction')
    @movie2 = @studio1.movies.create(title: 'Harry Potter', creation_year: 2000, genre: 'Fantasy')
    @movie3 = @studio2.movies.create(title: 'Wizard of Oz', creation_year: 1946, genre: 'Drama')
    @movie4 = @studio2.movies.create(title: 'Titanic', creation_year: 1998, genre: 'Drama')
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
  end

  describe 'page functionality' do
  end
end