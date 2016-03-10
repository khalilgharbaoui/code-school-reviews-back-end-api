require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let!(:codeschool) { Codeschool.create! name: 'codingschool' }
  let!(:review) { Review.create! valid_attributes }
  let(:valid_attributes) do
    {
      name: 'john doe',
      description: 'greate place to learn about code',
      rating: 4,
      codeschool_id: 1
    }
  end

  let (:invalid_attributes) do
    {
      name: '',
      description: '',
      rating: nil,
      codeschool_id: nil
    }
  end

  describe '#index' do
    it 'returns a 200' do
      get :index, codeschool_id: 1
      expect(response).to be_success
    end
    it 'returns json' do
      get :index, codeschool_id: 1
      expect(response.header['Content-Type']).to include('application/json')
    end
  end

  describe "#show" do
    it "has a valid show method" do
      get :show, id: 1, codeschool_id: 1
      expect(response).to be_success
    end
  end
  
  describe '#create' do
    context 'with valid params' do
      it 'creates a new Task' do
        expect do
          post :create, codeschool_id: 1, review: valid_attributes
        end.to change(Review, :count).by(1)
      end
    end
  end
  describe '#update' do
    it 'can process a update' do
      patch :update, id: 1, codeschool_id: 1, review: { name: 'Changed' }
      json = JSON.parse(response.body)
      expect(json['review']['name']).to eq 'Changed'
    end
  end
  describe "#destroy" do
    it "can remove a review" do
      delete :destroy, id: 1, codeschool_id: 1
      json = JSON.parse(response.body)
      expect(json['review']).to eq nil
    end
  end
end
