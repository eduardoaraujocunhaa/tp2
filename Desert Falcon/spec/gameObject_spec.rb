require 'spec_helper'

describe gameObject do

	before :each do
			@gameObjecttest = gameObject.new
  	end

	describe "#initialize" do
		it "image exists" do
			expect(gameObjecttest.image).to exist
		end
		it "box exists" do
			expect(gameObjecttest.box).to exist
		end
		it "z exists" do
			expect(gameObjecttest.z).to exist
		end
	end

	describe "#destroy"do
		it "box doesnt exists left"do
			gameObjecttest.destroy
  			expect(gameObjecttest.box.left).to be == 0
  		end
		it "box doesnt exists right"do
			gameObjecttest.destroy
		  	expect(gameObjecttest.box.right).to be == 0
		end
		it "box doesnt exists bottom"do
			gameObjecttest.destroy
		  	expect(gameObjecttest.box.bottom).to be == 0
		end
		it "box doesnt exists top"do
			gameObjecttest.destroy
		  	expect(gameObjecttest.box.top).to be == 0
		end
		it "position z"do
			gameObjecttest.destroy
  	 		expect(gameObjecttest.z).to be == 0
   		end
	end
end
