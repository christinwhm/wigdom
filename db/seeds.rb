# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

unless Admin.all.map(&:email).include?("hao@wigdom.com")
  Admin.create(:email => "hao@wigdom.com", :password => "foobar", :password_confirmation => "foobar")
end

unless Page.all.map(&:name).include?("contact")
  Page.create(:name => "contact")
end

unless Page.all.map(&:name).include?("about")
  Page.create(:name => "about")
end
