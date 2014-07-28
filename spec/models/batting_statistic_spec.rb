require 'rails_helper'

RSpec.describe BattingStatistic, :type => :model do
  describe "validations" do
    it {should belong_to(:stat)}
    it {should have_one(:player).through(:stat)}
  end

  describe ".slugging percentage" do
    it "calculates" do
      babe_ruth_1920_record = BattingStatistic.new(ab: 458, double: 36, triple: 9, hr: 54, h:  172 )
      expect(babe_ruth_1920_record.slugging_percentage).to eql(".847".to_f)
    end
  end

end
