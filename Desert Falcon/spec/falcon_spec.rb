require_relative '../lib/falcon'
require_relative 'spec_helper'


describe Falcon do

  before :each do
	   @falcontest = Falcon.new
  end

  describe "#initialize" do
    it "returns a falcon Object" do
      @falcontest.should be_an_instance_of Falcon
    end
    it "shadow exists"do
        @falcontest.box.shadow.should exist
    end
    it "box exists left"do
        expect(falcontest.box.left).not_to be == 0
    end
    it "box exists right"do
        expect(falcontest.box.right).not_to be == 0
    end
    it "box exists bottom"do
        expect(falcontest.box.bottom).not_to be == 0
    end
    it "box exists top"do
        expect(falcontest.box.top).not_to be == 0
    end
    it "position x"do
        expect(falcontest.x).to be == 320
    end
    it "position y"do
        expect(falcontest.y).to be == 250
    end
    it "position z"do
        @falcontest.z.shoul eql 1
    end
    it "sprite exists"do
        expect(falcontest.sprite).to exist
    end
  end
end
