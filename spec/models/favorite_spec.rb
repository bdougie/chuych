require 'spec_helper'

describe Favorite do
  let(:user) { FactoryGirl.build(:user) }
  let(:church) { FactoryGirl.build(:church) }

  it "should allow a user to favorite a church" do
    # this might invole stubing and passing in user, need to check church.favorited can be viewed  and taken out of the contoller.
  end
end
