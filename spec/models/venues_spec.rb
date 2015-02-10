require 'rails_helper'

describe Venue do
  before :each do
    @user = FactoryGirl.create(:user333, is_venue: true)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.create(:venue)).to be_valid
  end

  it 'validates with name, address, city, state columns' do
    venue = FactoryGirl.create(:venue)
    expect(venue.name).to eq('Gallery')
    expect(venue.address).to eq('1000 e 1000 s')
    expect(venue.city).to eq('Salt Lake City')
    expect(venue.state).to eq('UT')
  end

  it 'executes geocode to create latitude and longitude after creation' do
    venue = FactoryGirl.create(:venue)
    expect(venue.latitude).to_not be_nil 
    expect(venue.latitude).to eq(40.7472536)
    expect(venue.longitude).to_not be_nil
    expect(venue.longitude).to eq(-111.8624807)
  end

end