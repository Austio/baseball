require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe "validations" do
    it {should validate_uniqueness_of(:player_id)}
    it {should have_many(:player_teams)}
    it {should have_many(:teams).through(:player_teams)}
    it {should have_many(:stats)}
    it {should have_many(:batting_statistics).through(:stats)}
    it {should validate_uniqueness_of(:player_id)}
  end



  describe ".name" do
    let(:player){Player.new(name_last: nil, name_first:nil, player_id: "ruth01")}
    it "should be player id if first and last name are nil" do
      expect(player.name).to eql("ruth01")
    end
    it "should be player id if first name is nil" do
     player.name_first = "Babe"
     expect(player.name).to eql("ruth01")
    end
    it "should be player id if last name is nil" do
      player.name_last = "rust"
      expect(player.name).to eql("ruth01")
    end
    it "should be first + last name when filled" do
      player.name_first = "Babe"
      player.name_last  = "Ruth"
      expect(player.name).to eql("Babe Ruth")
    end


  end


end
