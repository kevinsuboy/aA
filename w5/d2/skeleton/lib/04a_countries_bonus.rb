# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    select name
    from countries
    where gdp > (
      select max(gdp)
      from countries
      where continent = 'Europe'
      group by continent
    )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    select continent,name,area
    from countries c
    where c.area = (
      select max(area)
      from countries
      group by continent
      having c.continent = continent
    )
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    select name,continent
    from countries c
    where
    population > 3*(
      select max(population)
      from countries
      where c.continent = continent and
        c.name != name
    )

  SQL
end
