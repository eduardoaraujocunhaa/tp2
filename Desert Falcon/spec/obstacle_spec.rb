require_relative '../lib/obstacle'
require_relative 'spec_helper'

describe Obstacle do

  before :all do
      @image = Sprite.new('../Sprites/obstacle.png')
  end
  before :each do
	   @obstacletest = Obstacle.new
  end

  describe "#initialize" do
    it "returns a hiero Object" do
      @obstacletest.should be_an_instance_of Obstacle
    end
    it "box exists right"do
   	  @obstacletest.box.right.should == (@obstacletest.box.left + @image.image.width)
    end
    it "box exists left"do
   	  @obstacletest.box.left.should >= 0 && @obstacletest.box.left.should <= 840
    end
    it "box exists top"do
   	  @obstacletest.box.top.should == (@obstacletest.box.bottom + @image.image.height)
    end
    it "box exists bottom"do
   	  @obstacletest.box.bottom.should >= -30  && @obstacletest.box.bottom.should <= 10
    end
    it "creates a box" do
      @obstacletest.box.should be_an_instance_of Box
    end
    #it "its on the ground" do
    #  @falcontest.z.should == 1
    #end
  end

  describe "#isdead" do
    it "is dead when its out of the gamewindow" do
      @obstacletest.box.top = 481
      @obstacletest.box.right = -1
      @obstacletest.isdead.should be_truthy
    end
    it "is not dead when it's created" do
      @obstacletest.isdead.should be_falsy
    end
  end

  describe "#update" do
    it "moves top +1" do
      updatetest = @obstacletest.box.top
      @obstacletest.update
      @obstacletest.box.top.should == updatetest + 1
    end
    it "moves left +1" do
      updatetest = @obstacletest.box.left
      @obstacletest.update
      @obstacletest.box.left.should == updatetest - 1
    end
    it "moves bottom +1" do
      updatetest = @obstacletest.box.bottom
      @obstacletest.update
      @obstacletest.box.bottom.should == updatetest + 1
    end
    it "moves right +1" do
      updatetest = @obstacletest.box.right
      @obstacletest.update
      @obstacletest.box.right.should == updatetest - 1
    end
  end

end
