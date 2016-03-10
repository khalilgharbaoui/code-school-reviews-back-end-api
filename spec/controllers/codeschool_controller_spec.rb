require 'rails_helper'
include FactoryGirl::Syntax::Methods

RSpec.describe CodeschoolController, type: :controller do

build(:codeschool)




  describe "GET #index" do
    it "gives a JSON of all codeschools" do
      get :index, format: :json
    end

    it "returns json" do
         get :index
         expect(response.header['Content-Type']).to include('application/json')
       end
  end

  describe "GET #show" do
    it "gives a JSON of one codeschool" do
      get :show, format: :json
    end
  end

  describe "POST #create" do
    it "creates a new Codeschool" do
       expect {post :create}.to change(Codeschool, :count).by(1)
     end
   end

   describe "DELETE #destroy" do
     it "remove a Codeschool" do
        expect {delete :destroy}.to change(Codeschool, :count).by(-1)
      end
    end


end
