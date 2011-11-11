# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Attendee.all.empty?
  badges_html = Nokogiri::HTML(open("https://codebits.eu/s/badges/2"))
  attendees   = badges_html.css('div.yui-g span.vcard a.url img')
  
  attendees.each do |attendee|
    name            = attendee.attributes['title'].to_s
    avatar_filename = attendee.attributes['src'].to_s[/\w+\/(\w+)/] + '.jpg'
  
    badge_url   = attendee.parent.attributes['href'].to_s
    badge_html  = Nokogiri::HTML(open("https://codebits.eu" + badge_url))
  
    profile_url = badge_html.css('div.yui-g p span.vcard a.url').first.attributes['href'].to_s
  
    Attendee.create(:name => name, :avatar_filename => "https://codebits.eu/"+avatar_filename, :profile_url => profile_url)
  end
end