require 'rails_helper'

describe Article do
  it { should validate_presence_of :title }
  it { should validate_presence_of :author }
  it { should validate_presence_of :points }
  it { should have_many :comments}
end
