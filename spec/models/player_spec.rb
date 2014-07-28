require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe "validations" do
    it {should validate_uniqueness_of(:player_id)}
    it {should have_many(:player_teams)}
    it {should have_many(:teams).through(:player_teams)}
    it {should have_many(:stats)}
    it {should have_many(:batting_statistics).through(:stats)}
  end


end
