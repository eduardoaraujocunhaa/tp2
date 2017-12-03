require "enemy"
require "spec_helper"

describe enemy do

  let(:enemytest) do
    enemy.new
  end

  describe "#initialize" do

    it "shadow exists"do
        expect(enemytest.shadow).to exist
    end
    it "box exists left"do
        expect(enemytest.box.left).not_to be == 0
    end
    it "box exists right"do
        expect(enemytest.box.right).not_to be == 0
    end
    it "box exists bottom"do
        expect(enemytest.box.bottom).not_to be == 0
    end
    it "box exists top"do
        expect(enemytest.box.top).not_to be == 0
    end
    it "position x"do
  	 expect(enemytest.x).to be_between(350, 590).inclusive
   end
   it "position y"do
  	 expect(enemytest.y).to be_between(0, 10).inclusive
   end
   it "position z"do
  	 expect(enemytest.z).to be == 1
   end
   it "sprite exists"do
  	 expect(enemytest.sprite).to exist
   end
    end
  end
