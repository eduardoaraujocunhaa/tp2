require "gameWindow"

RSpec.describe gameWindow  do
	describe "initialize" do
		let(:gameWindowL) do
			gameWindow.new
		end
		it "name" do
		expect(gameWindow.caption).to be == "Desert Falcon"
		end
		it "background exists" do
		expect(gameWindow.background_image).to exist
		end
		it "falcon exists" do
		expect(gameWindow.falcon).to exist
		end
		#@font = Gosu::Font.new(30)
		#hieros = []
		it "timer" do
		expect(gameWindow.timer).to be == 0
		end
		it "score" do
		expect(gameWindow.score).to be == 0
		end

	end

	#describe "score" do
	#	hiero.box.overlapsWith(@falcon.box)
	#end
end