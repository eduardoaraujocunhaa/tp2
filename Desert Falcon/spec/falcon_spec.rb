require "spec_helper"


describe Falcon do

  before :each do
	   @falcontest = falcon.new
  end

  describe "#initialize" do

    it "shadow exists"do
        expect(falcontest.shadow).to exist
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
        expect(falcontest.z).to be == 1
    end
    it "sprite exists"do
        expect(falcontest.sprite).to exist
    end
  end
end
