require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :codeschool }
  #it { should validate_inclusion_of(:rating). in_array([0, 1, 2, 3, 4, 5]) }

end
