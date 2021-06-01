class Studio < ApplicationRecord
  has_many :movies

  def actors_formatted
    movies.joins(:actor_movies, :actors)
          .where("actor_movies.actor_id = actors.id AND actors.currently_working = true")
          .order(age: :desc)
          .pluck(:name)
          .uniq

  end
end
