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
    select distinct yr
    from nobels n1
    where yr not in (
      select yr
      from nobels n2
      where subject = 'Chemistry'
    ) and subject = 'Physics'


  SQL
end
