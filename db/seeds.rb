# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artist.create! :name => 'John Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Fancy Lassiter', :email => 'fancy@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Alice Jimson', :email => 'jimso@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Alex Fredette', :email => 'afredette@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Fred Baz', :email => 'Bazzer@aol.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Cheryston Hall', :email => 'friendshipgoddess@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Babs Ficklemore', :email => 'bficklemore@yahoo.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Sydney Rammelstein-Hall', :email => 'SRammels@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Peter Frampston', :email => 'Peter@arthouse.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Lissy Johnson', :email => 'ljohnson@artdepot.com', :password => 'topsecret', :password_confirmation => 'topsecret'
Artist.create! :name => 'Sassy Rassmore', :email => 'SRassmore@artdepot.com', :password => 'topsecret', :password_confirmation => 'topsecret'


Work.create! :title =>'The best nude ever', :description => 'This is a fine period piece from 1974', :price: 100.00, :medium => 'Interprative Dance', :style => 'Romantic', :year => '1974' => artist_id: 4)





t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "is_artist",              default: false