require "gameWindow"

describe gameWindow  do
	describe "initialize" do
		let(:gameWindowtest) do
			gameWindow.new
		end
		it "name" do
		expect(gameWindowtest.caption).to be == "Desert Falcon"
		end
		it "background exists" do
		expect(gameWindowtest.background_image).to exist
		end
		it "falcon exists" do
		expect(gameWindowtest.falcon).to exist
		end
		it "timer" do
		expect(gameWindowtest.timer).to be == 0
		end
		it "score" do
		expect(gameWindowtest.score).to be == 0
		end

	end
