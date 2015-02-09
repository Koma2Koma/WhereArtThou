require 'rails_helper'

describe VenuesController do

  describe 'GET #index' do

    it 'populates an array of all venues' do
      venue = FactoryGirl.create(:venue)
      get :index
      expect(assigns(:venues)).to eq([venue])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'creates an instance variable @venue with the desired venue' do
      venue = FactoryGirl.create(:venue)
      get :show, id: venue
      expect(assigns(:venue)).to eq(venue)
    end

    it 'renders the :show view' do
      venue = FactoryGirl.create(:venue)
      get :show, id: venue
      expect(response).to render_template :show
    end
  end

end