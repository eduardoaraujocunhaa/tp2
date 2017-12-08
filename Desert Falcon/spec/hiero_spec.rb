require_relative '../lib/hiero'
require_relative 'spec_helper'


describe Hiero do

  before :all do
      @image = Sprite.new('../Sprites/hiero.png')
  end
  before :each do
	   @hierotest = Hiero.new
  end

  describe "#initialize" do
    it "returns a hiero Object" do
      @hierotest.should be_an_instance_of Hiero
    end
    it "box exists right"do
   	  @hierotest.box.right.should == (@hierotest.box.left + @image.image.width)
    end
    it "box exists left"do
   	  @hierotest.box.left.should >= 0 && @hierotest.box.left.should <= 840
    end
    it "box exists top"do
   	  @hierotest.box.top.should == (@hierotest.box.bottom + @image.image.height)
    end
    it "box exists bottom"do
   	  @hierotest.box.bottom.should >= -30  && @hierotest.box.bottom.should <= 10
    end
    it "creates a box" do
      @hierotest.box.should be_an_instance_of Box
    end
    it "its on the ground" do
      @hierotest.z.should == 1
    end
  end

  describe "#isdead" do
    it "is dead when its out of the gamewindow" do
      @hierotest.box.top = 481
      @hierotest.box.right = -1
      @hierotest.isdead.should be_truthy
    end
    it "is not dead when it's created" do
      @hierotest.isdead.should be_falsy
    end
  end

  describe "#update" do
    it "moves top +1" do
      updatetest = @hierotest.box.top
      @hierotest.update
      @hierotest.box.top.should == updatetest + 1
    end
    it "moves left +1" do
      updatetest = @hierotest.box.left
      @hierotest.update
      @hierotest.box.left.should == updatetest - 1
    end
    it "moves bottom +1" do
      updatetest = @hierotest.box.bottom
      @hierotest.update
      @hierotest.box.bottom.should == updatetest + 1
    end
    it "moves right +1" do
      updatetest = @hierotest.box.right
      @hierotest.update
      @hierotest.box.right.should == updatetest - 1
    end
  end

end
