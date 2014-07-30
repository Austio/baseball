require 'rails_helper'

RSpec.describe Team, :type => :model do
  describe "validations" do
    it {should have_many(:player_teams)}
    it {should have_many(:players).through(:player_teams)}
  end

end
