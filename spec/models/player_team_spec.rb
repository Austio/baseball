require 'rails_helper'

RSpec.describe PlayerTeam, :type => :model do
  describe "validations" do
    it {should belong_to(:player)}
    it {should belong_to(:team)}
  end
end