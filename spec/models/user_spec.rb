require 'spec_helper'

describe User do
	context do

	  it "is valid with email" do
	  	user = User.new(email: 'bill@email.com')
			expect(User.email).to eq('bill@email.com')
		end

	end
end
