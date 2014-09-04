require 'spec_helper'


describe Church do
	let(:church) { FactoryGirl.build(:church) }

	context "checking validation" do
	  it "is valid with a name, description, and city" do
	  	expect(church.name).to eq('Walmart Church')
	  	expect(church.description).to eq("There's a man, in a van, down by the river!")
	  	expect(church.city).to eq('Tampa')
	  	expect(church).to have(0).errors_on(:church)
	  end
	 end

	context "checking invalidation" do
		it "is invalid without name" do
			church.update_attributes(name: nil)
			expect(church.errors[:name]).to_not be_empty
		end

		it "is invalid without a city" do
			church.update_attributes(city: nil)
      expect(church.errors[:city]).to_not be_empty
		end

		it "is invalid without a description" do
			church.update_attributes(description: nil)
      expect(church.errors[:description]).to_not be_empty
		end

		it 'is invalid with description less 10 characters' do
			expect(Church.create(description: 'this is a descriptiojjjjjjjjjjjjjjjjjjjjjjjjjnj')).to_not have(1).errors_on(:description)
			expect(Church.new(description: 'this is a description')).to_not be_valid
		end
	end

	context 'Checking if a new church is created' do
		it 'is able to be saved' do
	    expect(church.valid?).to be(true)
	  end
	end

	context 'Checking church location is saved and recorded' do

		it "should save latitude and longitude by city" do
			# TODO update to check geolocation works
			expect(church.latitude).to be(nil)
		end
	end

end
