# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create name: "Goldman Sachs", description: "A full-service global investment banking and securities firm.", website: "http://www.goldmansachs.com/", logo: "http://ja-utah.org/wp-content/uploads/2012/09/goldman-sachs.gif"
Company.create name: "Morgan Stanley", description: "Global financial services firm and a market leader in securities, asset management and credit services.", website: "http://www.morganstanley.com/", logo: "http://news.doddleme.com/wp-content/uploads/2012/12/morgan-stanley.png"
Company.create name: "Deutsche Bank", description: "One of the world's leading financial service providers.", website: "https://www.db.com/us/", logo: "http://www.logostage.com/logos/deutsche_bank.png"
Company.create name: "Citigroup", description: "Our Investment Banking unit provides comprehensive financial advisory and capital raising services to top corporations, financial institutions and governments worldwide.", website: "http://www.citigroup.com/citi/", logo: "http://www.logodesignlove.com/images/classic/citi-logo.jpg"
Company.create name: "Bank of America Merrill Lynch", description: "Bank of America Merrill Lynch offers global commercial and corporate banking and markets solutions.", website: "http://corp.bankofamerica.com/", logo: "http://www.ivarjacobson.com/uploadedImages/Bank%20of%20America%20logo(1).jpg"
Company.create name: "Deloitte", description: "Consulting, audit, risk management, and tax services", website: "http://www.deloitte.com/", logo: "http://www.actuaries.org.uk/sites/all/files/event_sponsors/Deloitte_0.JPG"
Company.create name: "Boston Consulting Group", description: "The world's leading advisor on business strategy", website: "http://www.bcg.com/‎", logo: "http://www.arenaflowers.com/files/Image/arenaflowers.com/news/bcg-logo.gif"
Company.create name: "McKinsey & Company", description: "Trusted advisor and counselor to many of the world's most influential businesses and institutions.", website: "http://www.mckinsey.com/", logo: "http://cdn.business2community.com/wp-content/uploads/2012/09/McKinsey-logo1.gif"
Company.create name: "Accenture", description: "Accenture is a management consulting, technology services and outsourcing company helping clients become high-performance businesses and governments.", website: "http://www.accenture.com/‎", logo: "http://i1-news.softpedia-static.com/images/news2/40-of-Nokia-s-Outsourced-Symbian-Developers-quot-Laid-Off-Voluntarily-quot-by-Accenture-2.jpg"


Event.create title: "Goldman Sachs Recruiting Kick-off", location: "Nasher Museum of Art", description: "GS will discuss the application process, what makes an ideal candidate, and how to prepare for interviews!", date: DateTime.new(2013,9,3,18.5), end_date: DateTime.new(2013,9,3,20.5), company_id: 1
Event.create title: "Morgan Stanley: Internships 101", location: "The Washington Duke Inn", description: "Morgan Stanley to provide light snacks & refreshments for their info session.", date: DateTime.new(2013,9,4,16.25), end_date: DateTime.new(2013,9,4,18.25), company_id: 2
Event.create title: "Citi @ Duke Kickoff", location: "Fuqua School of Business", description: "Citi to discuss why they love Duke students so much!", date: DateTime.new(2013,9,10,17), end_date: DateTime.new(2013,9,10,19.5), company_id: 4
Event.create title: "BAML Info Session", location: "Washington Duke Inn & Golf Club", description: "Panel of BAML managers fielding any & all recruiting-related questions.", date: DateTime.new(2013,9,15,16.75), end_date: DateTime.new(2013,9,15,18.5), company_id: 5
Event.create title: "Opportunities with Deloitte", location: "WaDuke, Room 105", description: "Deloitte presents the global positions they're looking to fill at Duke.", date: DateTime.new(2013,9,16,17.5), end_date: DateTime.new(2013,9,16,19.5), company_id: 6
Event.create title: "BCG + You.", location: "Fuqua School of Business, McClendon Auditorium", description: "What makes BCG a special place to work, grow, and learn?", date: DateTime.new(2013,9,17,17.5), end_date: DateTime.new(2013,9,17,19), company_id: 7
Event.create title: "DB - Global Intern & Full-time Recruiting Seminar", location: "Duke Lemur Center", description: "As DB continues to grow in the US, we are looking to add at least 50 Duke students to our incoming analyst class. Come learn how to join!", date: DateTime.new(2013,9,10,17), end_date: DateTime.new(2013,9,10,19.5), company_id: 3
Event.create title: "Consulting Kickoff Mixer", location: "The Great Hall", description: "What sets McKinsey apart? Come find out.", date: DateTime.new(2013,9,1,17), end_date: DateTime.new(2013,9,1,19), company_id: 8
Event.create title: "Accelerate with Accenture", location: "Bryan Center (Mezzanine)", description: "Why we dropped Tiger Woods, and what this means for you.", date: DateTime.new(2013,9,20,18), end_date: DateTime.new(2013,9,20,20), company_id: 9
