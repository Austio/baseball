require 'rails_helper'

describe PlayerImporter do
  let(:player_importer){PlayerImporter.new('Master-small-good.csv')}

  it ".create_players" do
    expect(Player.count).to eql(0)
    player_importer.parse_csv
    expect(Player.count).to eql(7)

  end

end

