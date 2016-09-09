require 'rails_helper'

describe Comment do
  it { should validate_presence_of :text }
  it { should validate_presence_of :user }
  it { should validate_presence_of :article_id }
  it { should belong_to :article }
end
