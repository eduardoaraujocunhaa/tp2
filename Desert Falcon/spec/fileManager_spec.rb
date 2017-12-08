require_relative '../lib/fileManager'
require_relative 'spec_helper'

describe FileManager do

  before :each do
	   @fileManagertest = FileManager.new
  end

  describe "#initialize" do
    it "file's name" do
      @fileManagertest.file_name.should_not be_nil
    end
    it "with no hash_ranking" do
      @fileManagertest.hash_ranking.should be_empty
    end
    it "with no sorted_hash" do
      @fileManagertest.sorted_hash.should be_empty
    end
  end
  describe "#insert_player" do
    @fileManagertest.insert_player("test", "999")
    @fileManagertest.read_players
    filetest = IO.readlines("ranking.txt")
    filetest[0].should eql "test,999"
  end
end
