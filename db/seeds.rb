# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create name: "Goldman Sachs", description: "Global investment bank", website: "http://www.goldmansachs.com/", logo: "http://ja-utah.org/wp-content/uploads/2012/09/goldman-sachs.gif"
Company.create name: "Morgan Stanley", description: "Global investment bank", website: "http://www.morganstanley.com/", logo: "http://news.doddleme.com/wp-content/uploads/2012/12/morgan-stanley.png"
Company.create name: "Deutsche Bank", description: "Global investment bank", website: "https://www.db.com/us/", logo: "http://www.logostage.com/logos/deutsche_bank.png"
Company.create name: "Citigroup", description: "Global investment bank", website: "http://www.citigroup.com/citi/", logo: "http://www.logodesignlove.com/images/classic/citi-logo.jpg"
Company.create name: "Bank of America Merrill Lynch", description: "Global investment bank", website: "http://corp.bankofamerica.com/", logo: "http://www.ivarjacobson.com/uploadedImages/Bank%20of%20America%20logo(1).jpg"
Company.create name: "Deloitte", description: "Consulting, audit, risk management, and tax services", website: "http://www.deloitte.com/", logo: "http://www.actuaries.org.uk/sites/all/files/event_sponsors/Deloitte_0.JPG"
Company.create name: "Boston Consulting Group", description: "The world's leading advisor on business strategy", website: "www.bcg.com/‎", logo: "http://ingenimundi.com/site/wp-content/uploads/2013/07/BCG_logo.gif"


Event.create title: "Giant Financial Cocktail Mixer", location: "The Great Hall", date: DateTime.new(2013,9,1,17), end_date: DateTime.new(2013,9,1,19), company_id: 1
Event.create title: "Goldman Sachs Recruiting Kick-off", location: "Nasher Museum of Art", date: DateTime.new(2013,9,3,18.5), end_date: DateTime.new(2013,9,3,20.5), company_id: 1
Event.create title: "Morgan Stanley: Internships 101", location: "The Washington Duke Inn", date: DateTime.new(2013,9,4,16.25), end_date: DateTime.new(2013,9,4,18.25), company_id: 2
Event.create title: "DB - Global Intern & Full-time Recruiting Seminar", location: "Duke Lemur Center", date: DateTime.new(2013,9,10,17), end_date: DateTime.new(2013,9,10,19.5), company_id: 3
Event.create title: "Citi @ Duke Kickoff", location: "Fuqua School of Business", date: DateTime.new(2013,9,10,17), end_date: DateTime.new(2013,9,10,19.5), company_id: 4
Event.create title: "BAML Info Session", location: "Washington Duke Inn & Golf Club", date: DateTime.new(2013,9,15,16.75), end_date: DateTime.new(2013,9,15,18.5), company_id: 5
Event.create title: "Opportunities with Deloitte", location: "WaDuke, Room 105", date: DateTime.new(2013,9,16,17.5), end_date: DateTime.new(2013,9,16,19.5), company_id: 6
Event.create title: "BCG + You.", location: "Fuqua School of Business, McClendon Auditorium", date: DateTime.new(2013,9,17,17.5), end_date: DateTime.new(2013,9,17,19), company_id: 7