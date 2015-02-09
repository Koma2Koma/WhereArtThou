require 'rails_helper'
include Devise::TestHelpers

describe WorksController do
  describe 'GET #show' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
      @work = FactoryGirl.create(:work)
    end

    it 'creates an instance variable @work with the intended work' do
      get :show, {artist_id: 999, id: @work.id}
      expect(assigns(:work)).to eq(@work)
    end

    it 'renders the :show view' do
      get :show, {artist_id: 999, id: @work.id}
      expect(response).to render_template :show
    end
  end

  describe 'GET #index' do

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'creates an instace variable @works' do
      get :index
      expect(assigns(:works)).to_not be_nil
    end

    it 'creates an instace variable @artists' do
      get :index
      expect(assigns(:artists)).to_not be_nil
    end

    it 'creates an instace variable @venues' do
      get :index
      expect(assigns(:venues)).to_not be_nil
    end

    it 'creates an instace variable @events' do
      get :index
      expect(assigns(:events)).to_not be_nil
    end

    it 'creates an instace variable @users' do
      get :index
      expect(assigns(:users)).to_not be_nil
    end
  end

  describe 'GET #new' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
    end

    it 'renders the new view' do
      get :new, {artist_id: @artist999.id}
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
    end

    context 'with valid input' do
      it 'creates a new work' do 
        expect { 
          post :create, {artist_id: @artist999.id, work: FactoryGirl.attributes_for(:work)}
          }.to change(Work,:count).by(1) 
      end

      it 'redirects to artist page after new work is created' do
        post :create, {artist_id: @artist999.id, work: FactoryGirl.attributes_for(:work)}
        expect(response).to redirect_to @artist999
      end
    end

    context 'with invalid input' do
      it 'does not save the new work' do
        expect { 
          post :create, {artist_id: @artist999.id, work: FactoryGirl.attributes_for(:invalid_work)}
          }.to_not change(Work, :count)
      end

      it 're-renders the "new" page' do
        post :create, {artist_id: @artist999.id, work: FactoryGirl.attributes_for(:invalid_work)}
        expect(response).to render_template :new, {artist_id: @artist999.id}
      end
    end
  end

  describe 'GET #edit' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
      @work = FactoryGirl.create(:work)
    end

    it 'renders the edit view' do
      get :edit, {artist_id: @artist999.id, id: @work.id}
      expect(response).to render_template :edit
    end
  end

  describe 'PUT update' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
      @work = FactoryGirl.create(:work)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user333)
      sign_in user
      
    end

    context 'with valid input' do
      it 'locates the requested @work' do
        put :update, artist_id: @artist999.id, id: @work.id, 
          work: FactoryGirl.attributes_for(:work) 
        expect(assigns(:work)).to eq(@work)
      end

      it 'changes @work attributes' do
        put :update, artist_id: @artist999.id, id: @work.id, 
          work: FactoryGirl.attributes_for(:work, title: 'BumbleBee Tuna', image_file_name: 'images/bumb.jpg')
        @work.reload
        expect(@work.title).to eq('BumbleBee Tuna') 
        expect(@work.image_file_name).to eq('images/bumb.jpg')
      end

      it 'redirects to the updated work' do
        put :update, artist_id: @artist999.id, id: @work.id, 
          work: FactoryGirl.attributes_for(:work, title: 'BumbleBee Tuna', image_file_name: 'images/bumb.jpg')
        expect(response).to redirect_to @artist999
      end
    end

    context 'with invalid input' do
      it 'located the requested @work' do
        put :update, artist_id: @artist999.id, id: @work.id, 
          work: FactoryGirl.attributes_for(:invalid_work)
        expect(assigns(:work)).to eq(@work)
      end

      it 'does not change @work attributes' do
        put :update, artist_id: @artist999.id, id: @work.id, 
          work: FactoryGirl.attributes_for(:invalid_work)
        @work.reload
        expect(@work.title).to eq('Mona Lisa') 
        expect(@work.image_file_name).to eq('images/image.jpg')
      end

      it 're-renders the edit page' do
        put :update, artist_id: @artist999.id, id: @work.id, 
          work: FactoryGirl.attributes_for(:invalid_work)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @artist999 = FactoryGirl.create(:artist999)
      @work = FactoryGirl.create(:work)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user333)
      sign_in user
    end

    it 'deletes the work' do
      expect { delete :destroy, artist_id: @artist999.id, id: @work.id }.to change(Work,:count).by(-1)
    end

    it 'redirects to the artist page' do
      delete :destroy, artist_id: @artist999.id, id: @work.id
      expect(response).to redirect_to @artist999
    end
  end
end