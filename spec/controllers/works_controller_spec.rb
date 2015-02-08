require 'rails_helper'

describe WorksController do
  
  describe 'GET #show' do
    before :each do
      @artist_999 = FactoryGirl.create(:artist_999)
    end

    # it 'creates an instance variable @work with the intended work' do
    #   work = FactoryGirl.create(:work)
    #   get :show, artist_id: 999, id: work
    #   expect(assigns(:work)).to eq(work)
    # end

    it 'renders the :show view'

  end

  describe 'GET #index'
    it 'creates an instace variable @works'
    it 'creates an instace variable @artists'
    it 'creates an instace variable @venues'
    it 'creates an instace variable @events'
    it 'creates an instace variable @users'

  describe 'GET #get_work_data'
    it 'creates an instace variable @work'
    it 'creates an instace variable @artist'

  describe 'GET #new'
    it 'renders the new view'
    it 'assigns a new title and image_file_name to new works'

  describe 'POST #create'
    context 'with valid input'
      it 'creates a new work'
      it 'redirects to the new work'
    context 'with invalid input'
      it 'does not save the new work'
      it 're-renders the "new" page'

  describe 'GET #edit'
    it 'renders the edit view'

  describe 'PUT update'
    context 'valid input'
      it 'located the requested @work'
      it 'changes @work attributes'
      it 'redirects to the updated work'
    context 'invalid input'
      it 'located the requested @work'
      it 'does not change @work attributes'
      it 're-renders the edit page'

  describe 'DELETE destroy'
    it 'deletes the work'
    it 'redirects to the artist page'

end