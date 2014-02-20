require 'spec_helper'


describe Church do
	context "checking validation" do
	  it "is valid with a name" do 
	  	church = Church.new(name: 'Jesus')
	  	expect(church.name).to eq('Jesus')
	 	end
	  it "is valid with a description" do
	  	church = Church.new(description: 'river')
	  	expect(church.description).to eq('river')
	  end
	  it "is valid with a city" do
	    church = Church.new(city: 'Tampa')
	  	expect(church.city).to eq('Tampa')
	  end
	 end

	context "checking invalidation" do
	  # church = Church.create(name: 'bill')
		it "is invalid without name" do
			expect(Church.create(name: nil)).to have(1).errors_on(:name)
		end
	end 

	# context "checking invalidation with duplication" do


	# end	
end
