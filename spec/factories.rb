FactoryGirl.define do
  factory :venue do
    name 'Gallery'
    address '1000 e 1000 s'
    city 'Salt Lake City'
    state 'UT'
  end

  factory :invalid_venue, parent: :venue do |f|
    f.name nil
  end

  factory :work do
    title 'Mona Lisa'
    image_file_name 'images/image.jpg'
    artist_id 999
  end

  factory :artist_999 do
    id 999
  end
end