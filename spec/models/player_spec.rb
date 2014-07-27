require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe "validations" do
    it {should validate_uniqueness_of(:player_id)}
    it {should belong_to(:team)}
    it {should have_many(:stats)}
    it {should have_many(:batting_statistics).through(:stats)}
  end


end
