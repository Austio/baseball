require 'rails_helper'

describe BattingImporter do

  describe ".create_statistics" do
    it "should create statistics from csv" do
      batting_importer = BattingImporter.new("#{Rails.root}/spec/fixtures/Batting.csv")
      batting_importer.parse_csv
      expect(BattingStatistic.count).to eql(3)
    end

    it "should not create duplicate records" do
      batting_importer = BattingImporter.new("#{Rails.root}/spec/fixtures/Batting-duplicates.csv")
      batting_importer.parse_csv
      expect(BattingStatistic.count).to eql(2)
      expect(PlayerTeam.count).to eql(2)
    end

  end




end

