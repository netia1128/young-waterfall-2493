# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Studio.destroy_all
Movie.destroy_all

studio1 = Studio.create(name: 'Paramount Theaters', location: 'Los Angeles')
studio2 = Studio.create(name: 'Sundance', location: 'Park City')
movie1 = studio1.movies.create(title: 'Star Wars', creation_year: 1995, genre: 'Science Fiction')
movie2 = studio1.movies.create(title: 'Harry Potter', creation_year: 2000, genre: 'Fantasy')
movie3 = studio2.movies.create(title: 'Wizard of Oz', creation_year: 1946, genre: 'Drama')
movie4 = studio2.movies.create(title: 'Titanic', creation_year: 1998, genre: 'Drama')
