require 'rails_helper'
include FactoryGirl::Syntax::Methods

RSpec.describe CodeschoolController, type: :controller do

build(:codeschool)




  describe "GET #index" do
    it "gives a JSON of all tasks" do
      get :index, format: :json
    end
  end


end
