require 'spec_helper'

describe Favorite do
  let(:user) { FactoryGirl.build(:user) }
  let(:church) { FactoryGirl.build(:church) }

  it "should allow a user to follow a church" do
    expect(user.favorites(church)).to be_true
  end
end
