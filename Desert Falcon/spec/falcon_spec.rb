require "./falcon"
require "spec_helper"


RSpec.describe falcon do

  let(:falconL) do
  	falcon.new
  end

  describe "#initialize" do

    it "box exists left"do
    	expect(falconL.box.left).not_to be == 0
    end
    it "box exists right"do
    	expect(falconL.box.right).not_to be == 0
    end
    it "box exists bottom"do
    	expect(falconL.box.bottom).not_to be == 0
    end
    it "box exists top"do
    	expect(falconL.box.top).not_to be == 0
    end
    it "position x"do
    	expect(falconL.x).to be == 320
    end
    it "position y"do
    	expect(falconL.y).to be == 250
    end
    it "position z"do
    	expect(falconL.z).to be == 1
    end
    it "sprite exists"do
    	expect(falconL.sprite).to exist
    end
  end
end
