require 'rails_helper'

RSpec.describe BattingStatistic, :type => :model do
  describe "validations" do
    it {should belong_to(:stat)}
    it {should have_one(:player).through(:stat)}
  end

  let (:babe_ruth_1920_record) {BattingStatistic.new(ab: 458, double: 36, triple: 9, hr: 54, h:  172, stat_id: 1 )}


  describe "scopes" do
    before :each do
    end

    describe "self" do
      it "should scope by minimum at bat" do
        min_at_bat = 30
        FactoryGirl.create(:batting_statistic, ab: min_at_bat)
        FactoryGirl.create(:batting_statistic, ab: (min_at_bat-1))

        expect(BattingStatistic.min_ab(min_at_bat).count).to eql(1)
      end
    end

    describe "stat" do
      it "should only pick from certain year" do
        year = 2015
        batting_stat_1 = FactoryGirl.create(:batting_statistic)
        batting_stat_2 = FactoryGirl.create(:batting_statistic)
        stat_1 = FactoryGirl.create(:stat, year: year)
        stat_2 = FactoryGirl.create(:stat, player_id: 2, year: (year - 1), batting_statistic_id: batting_stat_2.id)

        expect(BattingStatistic.from_year(year).count).to eql(1)
      end
    end

    describe "team" do
      before :each do
        batting_stat_1 = FactoryGirl.create(:batting_statistic)
        batting_stat_2 = FactoryGirl.create(:batting_statistic)
        team_1   = FactoryGirl.create(:team)
        team_2   = FactoryGirl.create(:team, name: "STL", league: "AL")
        stat_1 = FactoryGirl.create(:stat)
        stat_2 = FactoryGirl.create(:stat, player_id: 2, batting_statistic_id: batting_stat_2.id, team_id: team_2.id)
      end

      it "should find by league" do
        expect(BattingStatistic.from_league("AL").count).to eql(1)
      end

      it "should find by team name" do
        expect(BattingStatistic.from_team("STL").count).to eql(1)
      end

    end
  end


  describe "batting attributes (hits, runs, etc)" do
    it "should not save nil values" do
      babe_ruth_1920_record.ab = nil
      expect(babe_ruth_1920_record).to_not be_valid
    end
    it "should not save negaitve values" do
      babe_ruth_1920_record.ab = -5
      expect(babe_ruth_1920_record).to_not be_valid
    end
  end



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

  describe ".singles" do
    it "calculates" do
      expect(babe_ruth_1920_record.singles).to eql(73)
    end
  end

  describe ".batting_average" do
    it "calculates" do
      expect(babe_ruth_1920_record.batting_average).to eql(".376".to_f)
    end
  end

end
