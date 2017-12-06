require_relative '../lib/falcon'
require_relative 'spec_helper'


describe Falcon do

  before :all do
      @image = Sprite.new('../Sprites/falcon.png')
  end
  before :each do
	   @falcontest = Falcon.new
  end

  describe "#initialize" do
    it "returns a falcon Object" do
      @falcontest.should be_an_instance_of Falcon
    end
    it "box exists right"do
   	  @falcontest.box.right.should == (@falcontest.box.left + @image.image.width)
    end
    it "box exists left"do
   	  @falcontest.box.left.should == 320
    end
    it "box exists top"do
   	  @falcontest.box.top.should == (@falcontest.box.bottom + @image.image.height)
    end
    it "box exists bottom"do
   	  @falcontest.box.bottom.should == 250
    end
    it "shadow exists"do
   	  shadow = Sprite.new('../Sprites/falcon_shadow.png')
      shadow.should be_an_instance_of Sprite
    end
    it "creates a box" do
      @falcontest.box.should be_an_instance_of Box
    end
    it "starts at the middle level" do
      @falcontest.z.should == 2
    end
  end

  describe "#update" do
    context "moves left" do
      it "top moves -2" do
        diretion = 'l'
        @falcontest.update(diretion)
        @falcontest.box.top.should == (250 + @image.image.height - 2)
      end
      it "bottom moves -2" do
        diretion = 'l'
        @falcontest.update(diretion)
        @falcontest.box.bottom.should == (250 - 2)
      end
      it "left moves -2" do
        diretion = 'l'
        @falcontest.update(diretion)
        @falcontest.box.left.should == (320 - 2)
      end
      it "right moves -2" do
        diretion = 'l'
        @falcontest.update(diretion)
        @falcontest.box.right.should == (320 + @image.image.height - 2)
      end
    end
    context "moves right" do
      it "top moves +2" do
        diretion = 'r'
        @falcontest.update(diretion)
        @falcontest.box.top.should == (250 + @image.image.width + 2)
      end
      it "bottom moves +2" do
        diretion = 'r'
        @falcontest.update(diretion)
        @falcontest.box.bottom.should == (250 + 2)
      end
      it "left moves +2" do
        diretion = 'r'
        @falcontest.update(diretion)
        @falcontest.box.left.should == (320 + 2)
      end
      it "right moves +2" do
        diretion = 'r'
        @falcontest.update(diretion)
        @falcontest.box.right.should == (320 + @image.image.height + 2)
      end
    end
    it "moves up" do
      diretion = 'u'
      @falcontest.update(diretion)
      @falcontest.z.should == 3
    end
    it "moves up" do
      diretion = 'd'
      @falcontest.update(diretion)
      @falcontest.z.should == 1
    end
  end

end
