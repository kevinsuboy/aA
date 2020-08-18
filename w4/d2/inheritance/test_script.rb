require_relative "Manager.rb"

ned = Manager.new("Ned","Founder",1000000,nil)
darren = Manager.new("Darren", "TA Manager",78000,ned)
shawna = Employee.new("Shawna","TA",12000,darren)
david = Employee.new("David","TA",10000,darren)

# Ned	\$1,000,000	Founder	nil
# Darren	\$78,000	TA Manager	Ned
# Shawna	\$12,000	TA	Darren
# David	\$10,000	TA	Darren

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

