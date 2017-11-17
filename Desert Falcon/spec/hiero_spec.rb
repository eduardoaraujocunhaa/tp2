require "hiero"
require "spec_helper"


RSpec.describe hiero do

   let(:hierotest) do
   	hiero.new
   end

  describe "#initialize" do
   it "box exists left"do
  	 expect(hierotest.box.left).not_to be == 0
   end
   it "box exists right"do
  	 expect(hierotest.box.right).not_to be == 0
   end
   it "box exists bottom"do
  	 expect(hierotest.box.bottom).not_to be == 0
   end
   it "box exists top"do
  	 expect(hierotest.box.top).not_to be == 0
   end
   it "position x"do
  	 expect(hierotest.x).to be_between(350, 590).inclusive
   end
   it "position y"do
  	 expect(hierotest.y).to be_between(0, 10).inclusive
   end
   it "position z"do
  	 expect(hierotest.z).to be == 1
   end
   it "sprite exists"do
  	 expect(hierotest.sprite).to exist
   end
  end

  describe "isDead" do
    @hierod = hiero.new #d de is dead
    @hierod.box.top = 481
    @hierod.box.right = -1
    it "position dead" do
      expect(hierod.isDead).to be_truthy
    end
  end
end
