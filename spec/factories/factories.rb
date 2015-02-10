FactoryGirl.define do
  
  factory :venue, class: Venue do
    id 42
    name 'Gallery'
    address '1000 e 1000 s'
    city 'Salt Lake City'
    state 'UT'
  end
    
  factory :invalid_venue, parent: :venue do |f|
    f.name nil
  end

  factory :event do
    venue_id 42
    id 25
    name 'ArtEvent'
    address '9350 South 150 East #575'
    city 'Sandy'
    state 'UT'
  end

  factory :invalid_event, parent: :event do
    name nil
  end

  factory :work do
    title 'Mona Lisa'
    image_file_name 'images/image.jpg'
    artist_id 999
    id 1099
  end

  factory :invalid_work, parent: :work do
    title nil
    image_file_name nil
    artist_id nil
  end

  factory :artist999, class: Artist do
    id 999
    user_id 2999
  end

  factory :user333, class: User do
    email 'email@email.com'
    username 'Fake Fakerson'
    password 'password'
    id 2999
  end
end