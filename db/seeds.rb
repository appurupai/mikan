# This file contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the 'rake db:seed' command.

print "Populating database..."

# Create the public pages : Home, Season, About-us & Contact-us
for i in 1..5 do
    Page.create(:content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
end

# A sample season in order to avoid error on the admin dashboard
Season.create(:title => "Sample Season")

# default admin user
User.create(:email => "admin@mik.an", :password => "qw12er34")

puts "OK"
puts "Default User : admin@mik.an // qw12er34"
puts "Login path : /login"
