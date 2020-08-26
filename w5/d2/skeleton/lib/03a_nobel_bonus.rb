# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  -- distinct physics.yr
  select distinct physics.yr
  from (
    
    SELECT
      distinct yr
    FROM
      nobels
    WHERE
      subject = 'Physics'
  ) as physics
  LEFT OUTER JOIN (
    SELECT
      distinct yr
    FROM
      nobels
    WHERE
      subject = 'Chemistry'
  ) as chemistry ON physics.yr = chemistry.yr
  where chemistry.yr is NULL
    SQL
  end
  

  # SCRAP BELOW
  # OUTER JOIN ?
  
  # self join
  # FROM
  #   nobels as physics
  # LEFT OUTER JOIN
  #   nobels as chemistry on physics.subject = chemistry.subject
  # WHERE
  #   physics.subject = 'Physics' and chemistry.subject = 'Chemistry'

# 2 subqueries

# find yrs where phys was won

# find yrs where chm was NOT won



