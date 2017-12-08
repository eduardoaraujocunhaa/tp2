require_relative '../lib/gameWindow'
require_relative 'spec_helper'

describe GameWindow  do
	before :each do
		@gameWindowtest = GameWindow.new
	end
	describe "#initialize" do
		it "name" do
			expect(@gameWindowtest.caption).to be == "Desert Falcon"
		end
		it "fileManager exists" do
			@gameWindowtest.file_manager.should be_an_instance_of FileManager
		end
		it "background exists" do
			@gameWindowtest.background_image.should be_an_instance_of Sprite
		end
		it "falcon exists" do
			@gameWindowtest.falcon.should be_an_instance_of Falcon
		end
		it "starts in the menu" do
			@gameWindowtest.status.should eql 'menu'
		end
		it "has a logo" do
			@gameWindowtest.logo.should be_an_instance_of Sprite
		end
		it "doesnt start with heiros on the screen" do
			@gameWindowtest.hieros.should be_empty
		end
		it "doesnt start with obstacles on the screen" do
			@gameWindowtest.obstacles.should be_empty
		end
		it "doesnt have with obstacle" do
			@gameWindowtest.obstacle.should be_nil
		end
		it "hiero timer stars at 0" do
			@gameWindowtest.timer_hiero.should == 0
		end
		it "obstacles and enemy's timer stars at 0" do
			@gameWindowtest.timer_obstacle_enemy.should == 0
		end
		it "score stars at 0" do
			@gameWindowtest.score.should == 0
		end
		it "doesnt start with obstacles on the screen" do
			@gameWindowtest.enemies.should be_empty
		end
		it "doesnt have with enemy" do
			@gameWindowtest.enemy.should be_nil
		end
	end
	#describe "#update" do

	#end
	#describe "#draw" do

	#end
	#describe "#button_down" do

	#end
	describe "#restart_params" do
		it "resets the parameters" do
			@gameWindowtest.restart_params
			@gameWindowtest.hieros.should be_empty
			@gameWindowtest.obstacles.should be_empty
			@gameWindowtest.enemies.should be_empty
			@gameWindowtest.falcon.should be_an_instance_of Falcon
			@gameWindowtest.score.should == 0
		end
	end
end
