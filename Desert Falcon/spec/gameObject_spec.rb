require_relative '../lib/gameObject'
require_relative 'spec_helper'

describe GameObject do

	before :each do
			@gameObjecttest = gameObject.new
  	end

	describe "#initialize" do
		it "returns a GameObject Object" do
      @gameObjecttest.should be_an_instance_of GameObject
    end
	end

	describe "#destroy"do
		it "left box doesnt exists"do
			gameObjecttest.destroy
  			@gameObjecttest.box.left.should == 0
  		end
		it "right box doesnt exists"do
			gameObjecttest.destroy
		  	@gameObjecttest.box.right.should == 0
		end
		it "bottom box doesnt exists"do
			gameObjecttest.destroy
		  	@gameObjecttest.box.bottom.should == 0
		end
		it "top box doesnt exists"do
			gameObjecttest.destroy
		  	@gameObjecttest.box.top.should == 0
		end
		it "position z"do
			gameObjecttest.destroy
  	 	@gameObjecttest.z.should == 0
   	end
	end
end
