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

def gold_cat_toys
  # Find all the toys that are `Gold` in color and have more than one word in
  # the name.

  # Sort the toys by name alphabetically.

  execute(<<-SQL)
    select t.name
    from toys t
    where t.color = 'Gold' and t.name like '% %'
    order by t.name
  SQL
end

def extra_jet_toys
  # `Jet` the cat has a ton of toys! 
  # Find the toys `Jet` has at least two copies of, and the number of copies.
  # Sort the toys by name alphabetically.

  execute(<<-SQL)
    select t.name, count(t.*)
    from toys t
    inner join cat_toys c_t on t.id = c_t.toy_id
    inner join cats c on c.id = c_t.cat_id
    where c.name = 'Jet'
    group by t.name
    having count(t.*)>=2
    order by t.name
  SQL
end


def cats_with_a_lot
  # Find the names of all cats with more than 7 toys.
  # Sort the cats by cat name alphabetically.

  execute(<<-SQL)
    select c.name
    from toys t
    inner join cat_toys c_t on t.id = c_t.toy_id
    inner join cats c on c.id = c_t.cat_id
    group by c.id
    having count(t.*)>7
    order by c.name
   

  SQL
end

def just_like_orange
  # Find the breed of the cat named `Orange`.
  # Then list the cats names and the breed of all the cats of Orange's breed.
  # Exclude the cat named `Orange` from your results.
  # Order by cats name alphabetically.

  execute(<<-SQL)
    select c.name,c.breed
    from cats c
    where c.breed = (
      select c2.breed
      from cats c2
      where c2.name = 'Orange'
    ) and c.name != 'Orange'
    order by c.name
  SQL
end

def expensive_tastes
  # Find the most expensive `Tiger` toy.
  # Find all the cats that own that specific toy.
  # List the name of the cat, name of the toy, and color of the toy.
  # Sort by cat name alphabetically.
 
  execute(<<-SQL)
    select c.name,t.name,t.color
    from toys t
    inner join cat_toys c_t on t.id = c_t.toy_id
    inner join cats c on c.id = c_t.cat_id
    where t.id = (
      select id
      from toys
      where toys.name = 'Tiger'
      order by toys.price desc
      limit 1
    )
    order by c.name
  SQL
end