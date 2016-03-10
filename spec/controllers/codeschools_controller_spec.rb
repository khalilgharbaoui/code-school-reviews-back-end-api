require 'rails_helper'
include FactoryGirl::Syntax::Methods

RSpec.describe CodeschoolsController, type: :controller do
  create(:codeschool)

  describe 'GET #index' do
    it 'should give us a JSON' do
      get :index
      expect(response.header['Content-Type']).to include('application/json')
    end

    it 'should reponse with a 200' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    it 'creates a new Codeschool' do
      expect { post :create }.to change(Codeschool, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    it 'remove a Codeschool' do
      expect { delete :destroy }.to change(Codeschool, :count).by(-1)
    end
  end
end
