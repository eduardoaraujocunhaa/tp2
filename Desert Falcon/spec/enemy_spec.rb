require_relative '../lib/enemy'
require_relative 'spec_helper'

describe Enemy do

  before :all do
      @image = Sprite.new('../Sprites/elephant.png')
  end
  before :each do
	   @enemytest = Enemy.new
  end

  describe "#initialize" do
    it "returns a enemy Object" do
      @enemytest.should be_an_instance_of Enemy
    end
    it "box exists right"do
   	  @enemytest.box.right.should == (@enemytest.box.left + @image.image.width)
    end
    it "box exists left"do
   	  @enemytest.box.left.should >= 0 && @enemytest.box.left.should <= 840
    end
    it "box exists top"do
   	  @enemytest.box.top.should == (@enemytest.box.bottom + @image.image.height)
    end
    it "box exists bottom"do
   	  @enemytest.box.bottom.should >= -30  && @enemytest.box.bottom.should <= 10
    end
    it "creates a box" do
      @enemytest.box.should be_an_instance_of Box
    end
    it "shadow exists"do
   	  shadow = Sprite.new('../Sprites/elephant_shadow.png')
      shadow.should be_an_instance_of Sprite
    end
    it "starts at a valid level" do
      @enemytest.z.should >= 1 && @enemytest.z.should <= 3
    end
  end

  describe "#update" do
    it "moves top +1" do
      updatetest = @enemytest.box.top
      @enemytest.update
      @enemytest.box.top.should == updatetest + 2
    end
    it "moves left +1" do
      updatetest = @enemytest.box.left
      @enemytest.update
      @enemytest.box.left.should == updatetest - 2
    end
    it "moves bottom +1" do
      updatetest = @enemytest.box.bottom
      @enemytest.update
      @enemytest.box.bottom.should == updatetest + 2
    end
    it "moves right +1" do
      updatetest = @enemytest.box.right
      @enemytest.update
      @enemytest.box.right.should == updatetest - 2
    end
  end
end
