require_relative './app/models/movie.rb'
movie = Movie.select(:id,:title,:score).where(score: 2..3)
movie.limit(2)
movie.order_by(:title)
