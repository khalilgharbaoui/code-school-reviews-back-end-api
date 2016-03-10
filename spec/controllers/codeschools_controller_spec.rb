require 'rails_helper'
include FactoryGirl::Syntax::Methods

RSpec.describe CodeschoolsController, type: :controller do

  let(:valid_attributes) do
    {
      name: "My new codeschool",
      description: "I'm writing tests now!",
      url: "http://someurl.url.com",
      logo: File.open(File.join(Rails.root, '/spec/fixtures/files/image.png'))
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      description: "",
      url: "",
      logo: ""
    }
  end


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

  describe "#show" do
    it "has a valid show method" do
      get :show, id: 1
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    it 'creates a new Codeschool' do
      expect { post :create, codeschool: valid_attributes
       }.to change(Codeschool, :count).by(1)
    end
  end

  describe "#update" do
    it "can process an update" do
      patch :update, id: 1, codeschool: { name: "updated" }
      json = JSON.parse(response.body)
      expect(json['codeschool']['name']).to eq "updated"
    end
  end

  describe "#destroy" do
    it "can remove a codeschool" do
      delete :destroy, id: 1
      json = JSON.parse(response.body)
      expect(json['codeschool']).to eq nil
    end
  end

end
