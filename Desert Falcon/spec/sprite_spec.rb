require_relative '../lib/sprite'
require_relative 'spec_helper'


describe Sprite do

  before :each do
	   @spritetest = Sprite.new('../Sprites/falcon.png')
  end

  describe "#initialize" do
    it "return an Sprite object"do
      @spritetest.should be_an_instance_of Sprite
    end
    it "throws an ArgumentError when given no arguments" do
      lambda {Sprite.new}.should raise_exception ArgumentError
    end
  end

end
