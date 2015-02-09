require 'rails_helper'

describe Venue do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:venue)).to be_valid
  end

  it 'validates name, address, city, state columns' do
    venue = FactoryGirl.create(:venue)
    expect(venue.name).to eq('Gallery')
    expect(venue.address).to eq('1000 e 1000 s')
    expect(venue.city).to eq('Salt Lake City')
    expect(venue.state).to eq('UT')
  end

  it 'is invalid without a venue name' do
    expect(FactoryGirl.build(:venue, name: '')).to_not be_valid
  end

  it 'is invalid without an address' do
    expect(FactoryGirl.build(:venue, address: '')).to_not be_valid
  end

  it 'is invalid without an city' do
    expect(FactoryGirl.build(:venue, city: '')).to_not be_valid
  end

  it 'is invalid without an state' do
    expect(FactoryGirl.build(:venue, state: '')).to_not be_valid
  end

  it 'executes geocode to create latitude and longitude after validation' do
    venue = FactoryGirl.create(:venue)
    expect(venue.latitude).to_not be_nil 
    expect(venue.latitude).to eq(40.7472536)
    expect(venue.longitude).to_not be_nil
    expect(venue.longitude).to eq(-111.8624807)
  end

end