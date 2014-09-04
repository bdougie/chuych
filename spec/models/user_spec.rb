require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it "can create a new user" do
    expect(user.valid?).to eq(true)
  end

  it "should fail validation without a username" do
    user.username = nil
    expect(user.valid?).to eq(false)
  end

  it "should fail validation without a email" do
    user.email = nil
    expect(user.valid?).to eq(false)
  end

  it "is has a name" do
		expect(user.name).to eq('brian')
	end

end
