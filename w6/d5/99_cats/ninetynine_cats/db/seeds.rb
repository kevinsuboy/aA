# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

Date.new(2001,2,3)

Cat.create([{name: "Chungus", birth_date: "09-04-2020", color: "blue", gender: "F", description: "lorem ipsum"}, {name: "apollo", birth_date: "03-02-2010", color: "black", gender: "M", description: "lorem ipsum"}, { name: "Maddy", gender: "F", birth_date: "10-10-2010", color: "orange", description: "lorem ipsum"}])

Cat.create([{name:"Tom",birth_date:"01-01-1900",color:"blue",gender:"01-01-1900",description:"I am a cat"},{name:"Joe",birth_date:"01-01-1900",color:"orange",gender:"F",description:"I am a cat"},{name:"Bart",birth_date:"01-01-1900",color:"red",gender:"M",description:"I am a cat"},{name:"Coltrane",birth_date:"01-01-1900",color:"green",gender:"F",description:"I am a cat"},{name:"Megatron",birth_date:"01-01-1900",color:"black",gender:"M",description:"Autobots, roll out"}])
