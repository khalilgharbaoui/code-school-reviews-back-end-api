require 'rails_helper'
include FactoryGirl::Syntax::Methods
build(:review)
build(:codeschool)
RSpec.describe CodeschoolsController, type: :routing do
  it { should route(:get, '/').to(action: :index) }
  it { should route(:post, '/codeschools').to(action: :create)}
  it { should route(:get, '/codeschools/1').to(action: :show, id: 1) }
  it { should route(:patch, '/codeschools/1').to(action: :update, id: 1)}
  it { should route(:delete, '/codeschools/1').to(action: :destroy, id: 1)}
end
