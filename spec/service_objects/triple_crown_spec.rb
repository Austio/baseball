require 'rails_helper'

describe TripleCrown do
  before(:each) do
    3.times do
     stat = Stat.create(year: 2014)
     stat.player.create(``)
    end
  end


  describe ".returns the winner" do
    it "creates plasers ignoring duplicates" do
      expect(Player.count).to eql(0)
      player_importer.parse_csv
      expect(Player.count).to eql(6)
    end

  end

end

