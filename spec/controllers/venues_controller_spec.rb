require 'rails_helper'

describe VenuesController do
  describe 'GET #index' do
    it 'populates an array of all venues'
    it 'renders the :index view'
  end

  describe 'GET #show' do
    it 'creates an instance variable @venue with the desired venue'
    it 'renders the :show view'
  end

end