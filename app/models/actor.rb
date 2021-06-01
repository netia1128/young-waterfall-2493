class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.currently_working
    where(currently_working: true)
  end

  def self.order_by_age
    order(age: :desc)
  end
end
