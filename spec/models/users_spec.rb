require 'rails_helper'

RSpec.describe Users, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'GET #show' do
    it "responds successfully with an HTTP 200 status code" do
      get :show

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

  end
end
