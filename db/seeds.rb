# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! :username => 'John Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Fancy Lassiter', :email => 'fancy@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Alice Jimson', :email => 'jimso@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Alex Fredette', :email => 'afredette@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Fred Baz', :email => 'Bazzer@aol.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Cheryston Hall', :email => 'friendshipgoddess@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Babs Ficklemore', :email => 'bficklemore@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Sydney Rammelstein-Hall', :email => 'SRammels@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Peter Frampston', :email => 'Peter@arthouse.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Lissy Johnson', :email => 'ljohnson@artdepot.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true
User.create! :username => 'Sassy Rassmore', :email => 'SRassmore@artdepot.com', :password => 'topsecret', :password_confirmation => 'topsecret', is_artist: true

Work.create! :title =>'June Nude', :year => '1974', :price => '$2000', :description => 'This is a nice example of my early work', :medium => 'oil on canvas', :style => 'Modern'
Work.create! :title =>'July Nude', :year => '1974', :price => '$2000', :description => 'This is a nice example of my early work', :medium => 'oil on canvas', :style => 'Modern'
Work.create! :title =>'August Nude', :year => '1974', :price => '$2000', :description => 'This is a nice example of my early work', :medium => 'oil on canvas', :style => 'Modern'
Work.create! :title =>'September Nude', :year => '1974', :price => '$2000', :description => 'This is a nice example of my early work', :medium => 'oil on canvas', :style => 'Modern'


