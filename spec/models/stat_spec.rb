require 'rails_helper'

RSpec.describe Stat, :type => :model do
  describe "validations" do
    it {should belong_to(:player)}
    it {should belong_to(:team)}
    it {should have_one(:batting_statistic)}
  end
end
