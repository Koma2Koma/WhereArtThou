require 'rails_helper'

describe EventsController do

  describe 'GET #new' do
    before :each do
      @venue = FactoryGirl.create(:venue12)
    end
    it 'renders new event view' do
      get :new, {venue_id: @venue.id}
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before :each do
      @venue = FactoryGirl.create(:venue12)
    end
    context 'with valid input' do
      it 'creates a new event' do 
        expect { 
          post :create, {venue_id: @venue.id, event: FactoryGirl.attributes_for(:event)}
          }.to change(Event,:count).by(1) 
      end
      it 'redirects to venue page after new event is created' do
        post :create, {venue_id: @venue.id, event: FactoryGirl.attributes_for(:event)}
        expect(response).to redirect_to @venue
      end
    end

    context 'with invalid input' do
      it 'does not save the new event' do
        expect { 
          post :create, {venue_id: @venue.id, event: FactoryGirl.attributes_for(:invalid_event)}
          }.to_not change(Event, :count)
      end

      it 're-renders the "new" page' do
        post :create, {venue_id: @venue.id, event: FactoryGirl.attributes_for(:invalid_event)}
        expect(response).to render_template :new, {venue_id: @venue.id}
      end
    end
  end

  describe 'PATCH update event' do
    before:each do
      @venue = FactoryGirl.create(:venue12)
      @event = FactoryGirl.create(:event)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user333)
      sign_in user

    end
    context 'valid attributes' do
      it 'locates the requested @event' do
        patch :update, :venue_id => @event.venue_id, :id => @event.id, event: attributes_for(:event)
        expect(assigns(:event)).to eq(@event)
      end
      it 'changes event attributes' do
        patch :update, :venue_id => @event.venue_id, id: => @event.id, event: attributes_for(:event,
            name: 'new name',
            address: 'new address',
            city: 'new city',
            state: 'new state')
          @event.reload
          expect(@event.name).to eq('new name')
          expect(@event.address).to eq('new address')
          expect(@event.city).to eq('new city')
          expect(@event.state).to eq('new state')
      end
      it 'redirects to the assigned venue' do
        patch :update, :venue_id => @event.venue_id, id: @event.id, event: attributes_for(:event)
        expect(response).to redirect_to @venue
      end
    end

    context 'invalid attributes' do
      it 'locates the requested event' do
      put :update, venue_id: @venue.id, id: @work.id, 
        work: FactoryGirl.attributes_for(:invalid_event)
      expect(assigns(:work)).to eq(@work)
      end
      it 'does not change event attributes' do
        put :update, venue_id: @venue.id, id: @work.id, 
          work: FactoryGirl.attributes_for(:invalid_event)
        @event.reload
        expect(@event.name).to eq('Art show') 
        expect(@event.address).to eq('700 e 600 s')
        expect(@event.city).to eq('Salt Lake City')
        expect(@event.state).to eq('UT')
      end
      it 're-renders the edit page' do
        put :update, venue_id: @venue.id, id: @work.id, 
          work: FactoryGirl.attributes_for(:invalid_work)
        expect(response).to render_template :edit
      end
    end
  end
end

