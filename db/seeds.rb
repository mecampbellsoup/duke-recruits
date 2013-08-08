# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create name: "Goldman Sachs", description: "Global investment bank", website: "http://www.goldmansachs.com/", image: "Goldman-Sachs1.jpg"
Company.create name: "Morgan Stanley", description: "Global investment bank", website: "http://www.morganstanley.com/", image: "Morgan_Stanley_logo.png"
Company.create name: "Deutsche Bank", description: "Global investment bank", website: "https://www.db.com/us/", image: "deutsche-bank-logo.jpg"
Company.create name: "Citigroup", description: "Global investment bank", website: "http://www.citigroup.com/citi/", image: "citi_logo.jpg"
Company.create name: "Bank of America Merrill Lynch", description: "Global investment bank", website: "http://corp.bankofamerica.com/", image: "baml_logo.jpg"

Event.create([
  {title: "Giant Financial Cocktail Mixer", location: "Great Hall", date: DateTime.new(2013,9,1,17), end_date: DateTime.new(2013,9,1,19)}
  {title: "Goldman Sachs Recruiting Kick-off", location: "Great Hall", date: DateTime.new(2013,9,3,18.5), end_date: DateTime.new(2013,9,3,20.5)}
  {title: "Morgan Stanley: Internships 101", location: "Great Hall", date: DateTime.new(2013,9,4,16.25), end_date: DateTime.new(2013,9,4,18.25)}
  {title: "DB - Global Intern & Full-time Recruiting Seminar", location: "Great Hall", date: DateTime.new(2013,9,10,17), end_date: DateTime.new(2013,9,10,19.5)}
