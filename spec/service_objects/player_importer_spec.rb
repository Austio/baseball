require 'rails_helper'

describe PlayerImporter do
  let(:player_importer){PlayerImporter.new("#{Rails.root}/spec/fixtures/Master-small-good.csv")}

  describe ".create_players csv" do
    it "creates plasers ignoring duplicates" do
      expect(Player.count).to eql(0)
      player_importer.parse_csv
      expect(Player.count).to eql(6)
    end

  end

end

