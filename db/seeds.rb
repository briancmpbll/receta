# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Recipe.create!([
  { name: 'Baked Potato w/ Cheese',
    instructions: 'nuke for 20 minutes'
  },
  {
    name: 'Baked Brussels Sprouts',
    instructions: 'Slather in oil, and roast on high heat for 20 minutes'
  }
])
