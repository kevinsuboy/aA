# == Schema Information
#
# Table name: cats
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  breed       :string
#
# Table name: toys
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  price       :integer
#
# Table name: cat_toys
#
#  id          :integer      not null, primary key
#  cat_id      :integer      not null, foriegn key
#  toy_id      :integer      not null, foreign key

require_relative '../data/pg_helper.rb'

def freyja
  # Find the names of all the cats that are the same color as the cat named 
  # `Freyja`.
  # Do not include `Freyja` in the results.
  # Sort by cat name alphabetically.

  execute(<<-SQL)
    select c.name
    from cats c
    where c.color = (
      select color
      from cats
      where name = 'Freyja'
    ) and c.name != 'Freyja'
    order by c.name
  SQL
end


def find_unknown
  # Find all the toys names that belong to the cat who's breed is `Unknown`.
  # Only return the toys that have more than one word in the name.
  # Order from the most expensive to least.

  execute(<<-SQL)
    select t.name
    from toys t
    inner join cat_toys c_t on t.id = c_t.toy_id
    inner join cats c on c.id = c_t.cat_id
    where c.breed = 'Unknown' and t.name like '% %'
    order by t.price desc
   
  SQL
end

def five_cheap_toys
  # Find the name and prices for the five cheapest toys.
  # Order by toy price from most expensive to least.

  execute(<<-SQL)
    select t.tn,t.tp
    from (
      select t.name tn,t.price tp
      from toys t
      order by t.price
      limit 5
      ) t
    order by t.tp desc
  SQL
end

def rich_crypto_cats
  # `Bitcoin Cash` became a really popular toy sold at different prices.
  # Find the lowest price of the toy `Bitcoin Cash`.
  # List the names of the cats who acquired the toy at its lowest price.
  # Order by the cat name alphabetically.

  execute(<<-SQL)
    select c.name
    from toys t
    inner join cat_toys c_t on t.id = c_t.toy_id
    inner join cats c on c.id = c_t.cat_id
    where (t.name,t.price) = (
      select t.name tn, t.price tp
      from toys t
      where t.name = 'Bitcoin Cash'
      order by t.price
      limit 1
    )
    order by c.name
  SQL
end

def toy_that_jet_owns
  # Find the most expensive toy that is owned by the cat named `Jet`.
  # Find the cats that own toys of the same name.
  # List the name of the cat and the name of the toy.
  # Exclude Jet from the results.
  # Order by cat name alphabetically.

  execute(<<-SQL)
    select c.name, t.name
    from toys t
    inner join cat_toys c_t on t.id = c_t.toy_id
    inner join cats c on c.id = c_t.cat_id
    where c.name != 'Jet' and t.name = (
      select t.name tn
      from toys t
      inner join cat_toys c_t on t.id = c_t.toy_id
      inner join cats c on c.id = c_t.cat_id
      where c.name = 'Jet'
      order by t.price desc
      limit 1
    )
    order by c.name
  SQL
end