require "obstacle"

RSpec.describe obstacle do 

let(:obstacleL) do # L pois esta no let
  		obstacle.new
  	end

describe "#initialize" do
		it "image exists" do
			expect(obstacleL.image).to exist
		end
		it "box exists" do
			expect(obstacleL.box).to exist
		end
		it "shadow exists" do
			expect(obstacleL.shadow).to exist
		end
		it "z exists" do
			expect(obstacleL.z).to exist
		end
	end

end
