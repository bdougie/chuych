require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:confirmed_user) }

  context "checking invalidation" do
    it "can create a new user" do

      expect(user.valid?).to eq(true)
    end

    it "is has a name" do
      expect(user.errors[:name]).to be_empty
      expect(user[:name]).to_not be_empty
    end

    it "is has a email" do
      expect(user.errors[:email]).to be_empty
      expect(user[:email]).to_not be_empty
    end

    it "is has a username" do
      expect(user.errors[:username]).to be_empty
      expect(user[:username]).to_not be_empty
    end
  end

  context "checking invalidation" do
    it "should fail validation without a username" do
      user.username = nil
      expect(user.valid?).to eq(false)
      expect(user.errors[:username]).to_not be_empty
    end

    it "should fail validation without a email" do
      user.email = nil
      expect(user.valid?).to eq(false)
      expect(user.errors[:email]).to_not be_empty
    end
  end

end
