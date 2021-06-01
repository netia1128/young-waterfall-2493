class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.find_by_name(name)
    where(name: name).first
  end

  def coactors
    movies = self.movies
    coactors = []
    movies.each do |movie|
      coactors << movie.actors
    end
    coactors.flatten
  end
end
