# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NEIGHBORHOODS = [
  "Allston",
  "Back Bay",
  "Bay Village",
  "Beacon Hill",
  "Brighton",
  "Charlestown",
  "Chinatown/Leather District",
  "Dorchester",
  "Downtown",
  "East Boston",
  "Fenway/Kenmore",
  "Hyde Park",
  "Jamaica Plain",
  "Mattapan",
  "Mission Hill",
  "North End",
  "Roslindale",
  "Roxbury",
  "South Boston",
  "South End",
  "West End",
  "West Roxbury"
]

NEIGHBORHOODS.each do |neighborhood|
  Neighborhood.create(name: neighborhood)
end
