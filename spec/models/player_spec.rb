require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe "validations" do
    it {should validate_uniqueness_of(:player_id)}
  end


end
