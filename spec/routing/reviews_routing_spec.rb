require 'rails_helper'

RSpec.describe ReviewsController, type: :routing do
  it { should route(:get, '/codeschools/1/reviews').to(action: :index, codeschool_id: 1) }
  it { should route(:post, '/codeschools/1/reviews').to(action: :create, codeschool_id: 1)}
  it { should route(:get, '/codeschools/1/reviews/1').to(action: :show, id: 1, codeschool_id: 1) }
  it { should route(:patch, '/codeschools/1/reviews/1').to(action: :update, id: 1, codeschool_id: 1)}
  it { should route(:delete, '/codeschools/1/reviews/1').to(action: :destroy, id: 1, codeschool_id: 1)}
end
