require 'rails_helper'

RSpec.describe ArtistsController, :type => :controller do
  
  describe 'GET #show' do
    before :each do
      @artist = FactoryGirl.create(:artist999)
    end
    it 'renders correct artist show page' do
      get :show, id: @artist.id
      expect(response).to render_template :show, id: @artist.id
    end
  end

  describe 'GET #about' do
    before :each do
      @artist = FactoryGirl.create(:artist999)
    end
    it 'renders correct artist about page' do
      get :about, id: @artist.id
      expect(response).to render_template :about, id: @artist.id
    end
  end

end
