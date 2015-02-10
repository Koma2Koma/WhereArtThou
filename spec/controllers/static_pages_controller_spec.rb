 require 'rails_helper'

describe StaticPagesController, :type => :controller do
  describe 'GET #discover' do
    it "responds successfully with an HTTP 200 status code" do
      get :discover

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    # it 'loads all the venues' do
      
    # end

    it 'loads 5 random artists' do
      10.times do
        artist = Artist.create!
      end
      get :discover

      artists = assigns(:featured_artists)
      expect(artists.count).to eql(5)
      expect(artists.sort).to_not eql(artists)
    end
  end
end
