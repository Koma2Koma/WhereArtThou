require 'rails_helper'
include Devise::TestHelpers

describe UsersController do
  describe 'GET #show' do
    before :each do
      @user = FactoryGirl.create(:user333)
    end

    it 'renders correct user show page' do
      get :show, id: @user.id
      expect(response).to render_template :show, id: @user.id
    end
    
    it 'creates an instance variable @mosaic with array of works' do
      get :show, id: @user.id
      expect(assigns(:mosaic)).to_not be_nil
    end

    it 'creates an instance variable @user with intended user' do
      get :show, id: @user.id
      expect(assigns(:user)).to eq(@user)
    end
  end
end