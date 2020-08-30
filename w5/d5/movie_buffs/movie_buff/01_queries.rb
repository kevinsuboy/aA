def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3



  # .where(score: 2..3)
  # basic select from 'movie' table
  movie = Movie
  .select(:id,:title,:score)
  .where(score: 2..3) # this doesn't ex
  # movie = movie.limit(2)# this doesn't ex
  # p movie # this would ex (?)
  # movie = movie.order(:title)# this doesn't ex

  # our concl: rails c ex. right away
end

def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor


  # id title, movies
    # Movie model
    # select(id, title)
  # Movie relations to get an actor:
    # has_many actors (produces Actor)
  # Condition (where)
    # appear, but not leadd
    # lead implies id #1?

  # .join(actors)
    # we get a giant table of movies+actors
    # we can filter with actor names
    # filter re on actor_id value
  Movie
  .select(:id,:title)
  .joins(:actors)
  .where(actors: {name: 'Harrison Ford'})
  .where.not(castings: {ord: 1})

  # WHERE
    # actors.name = 'HF'
  # WHERE NOT
    # castings.ord != 1
end

def biggest_cast
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)


# ? where do we put aggre
  #! aggr is its own thing
    # .sum, .count, .max

  # MOVIES relation
  #! Desired SQL:
  # SELECT:
    # id, title, count(castings)
  # GROUP BY #? do we need to activerec?
    # movie_id (id)
  # ORDER
    # most actors
  # castings.. list of actors (JOIN)
    # count these
  # 3 moves (LIMITS 3)
  Movie
    .select(:id,:title)
    .order('count(castings) DESC')
    .joins(:castings)
    .group(:id)
    .limit(3)

end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.
  Movie
  .select(:id,:title)
  .joins(:director)
  .where(actors: {name: them})
end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.
  Movie.where('yr<1940').pluck(:title)
end
