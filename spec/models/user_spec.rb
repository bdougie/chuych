require 'spec_helper'

describe User do
	# skip_confirmation :password
	user = User.create(name: 'brian', password: '12345678', email: 'ilikerobot@gmail.com')
	context do

	  it "is has a name" do
			expect(User.name).to eq('brian')
		end
	end
end
