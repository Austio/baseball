require 'rails_helper'

describe FileImporter do
  let(:file_importer){FileImporter.new('Master-small-good.csv')}

  describe ".to_hash" do
    it "should return proper input" do
      line    = ["aaronha01", "1934"]
      column  = ["player_id", "birth_year"]

      output   = {"player_id" => "aaronha01", "birth_year" => "1934"}
      expect(file_importer.to_hash(column, line)).to eql(output)
    end
  end

  describe ".format_column" do
    it "should return underscored column names" do
      column  = ["playerID", "birthYear"]
      output  = ["player_id", "birth_year"]
      expect(file_importer.format_column(column)).to eql(output)
    end
  end

  describe ".find_or_create_" do
    describe "team_id" do
      it "should upcase the team and league" do
        @team = Team.create(name: "ATL", league: "NL")
        # expect(Team).to receive(:find_or_create_by).with_options("ATL", "NL").and_return(1)
        expect(file_importer.find_or_create_team_id("atl", "nl")).to eql(@team.id)
      end
    end
    describe "player_id" do
      it "should downcase the player" do
        @player = Player.create(player_id: "superplayer01")
        # expect(Team).to receive(:find_or_create_by).with_options("ATL", "NL").and_return(1)
        expect(file_importer.find_or_create_player_id("SuperPLaYer01")).to eql(@player.id)
      end
    end


   end


end

