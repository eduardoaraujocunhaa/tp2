require "gameObject"

RSpec.describe gameObject do 
	
	let(:gameObjectL) do # L pois esta no let
  		gameObject.new
  	end

	describe "#initialize" do
		it "image exists" do
			expect(gameObjectL.image).to exist
		end
		it "box exists" do
			expect(gameObjectL.box).to exist
		end
		it "z exists" do
			expect(gameObjectL.z).to exist
		end
	end

	describe "destroy"do
		@gameobject = gameObject.new
		gameobject.destroy
		it "box doesnt exists left"do
  			expect(gameobject.box.left).to be == 0
  		end
		it "box doesnt exists right"do
		  	expect(gameobject.box.right).to be == 0
		end
		it "box doesnt exists bottom"do
		  	expect(gameobject.box.bottom).to be == 0
		end
		it "box doesnt exists top"do
		  	expect(gameobject.box.top).to be == 0
		end
		it "position z"do
  	 		expect(gameobject.z).to be == 0
   		end
	end
		
end