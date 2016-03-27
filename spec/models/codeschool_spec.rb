require 'rails_helper'

RSpec.describe Codeschool, type: :model do
  it { should have_many :reviews }
end
