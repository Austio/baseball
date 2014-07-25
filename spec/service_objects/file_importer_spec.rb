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

end

