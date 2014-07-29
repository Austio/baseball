require 'rails_helper'

RSpec.describe BattingStatistic, :type => :model do
  describe "validations" do
    it {should belong_to(:stat)}
    it {should have_one(:player).through(:stat)}
  end

  let (:babe_ruth_1920_record) {BattingStatistic.new(ab: 458, double: 36, triple: 9, hr: 54, h:  172 )}


  describe ".slugging percentage" do
    it "calculates" do
      expect(babe_ruth_1920_record.slugging_percentage).to eql(".847".to_f)
    end
  end

  describe ".base_count" do
    it "calculates" do
      expect(babe_ruth_1920_record.base_count).to eql(388)
    end
  end

  describe ".hits" do
    it "calculates" do
      expect(babe_ruth_1920_record.hits).to eql(73)
    end
  end

  describe ".batting_average" do
    it "calculates" do
      expect(babe_ruth_1920_record.batting_average).to eql(".159".to_f)
    end
  end

end
