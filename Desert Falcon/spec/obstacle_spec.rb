require 'spec_helper'

describe obstacle do

	before :each do
		@obstacletest = obstacle.new
  end

	describe "#initialize" do
		it "image exists" do
			expect(obstacletest.image).to exist
		end
		it "box exists" do
			expect(obstacletest.box).to exist
		end
		it "shadow exists" do
			expect(obstacletest.shadow).to exist
		end
		it "z exists" do
			expect(obstacletest.z).to exist
		end
	end
end
