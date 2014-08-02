require 'rails_helper'

describe MostImproved do

  before :each do
  end


  it "should be able to find the max of any stat" do
    most_improved_start  = FactoryGirl.create(:batting_statistic, :rbi => 0)
    most_improved_finish = FactoryGirl.create(:batting_statistic, :rbi => 1000)
    most_improved_start_year   = FactoryGirl.create(:stat, :year => 2012, :batting_statistic_id => most_improved_start.id)
    most_improved_finish_year  = FactoryGirl.create(:stat, :year => 2013, :batting_statistic_id => most_improved_finish.id)

    loser_start  = FactoryGirl.create(:batting_statistic, :rbi => 50)
    loser_finish = FactoryGirl.create(:batting_statistic, :rbi => 50)

    loser_start_year  = FactoryGirl.create(:stat, :year => 2012, :player_id => '2', :batting_statistic_id => loser_start.id)
    loser_finish_year = FactoryGirl.create(:stat, :year => 2013, :player_id => '2', :batting_statistic_id => loser_finish.id)


    most_improved_player = FactoryGirl.create(:player,:player_id => 1, :player_id => 'baberuth')

    expect(MostImproved.calculate("rbi",2012, 2013, 0)).to eql( "Most improved rbi between 2012-2013 --- 1000 - baberuth"
                                                           )
  end

  it "should be able to return both players on a tie" do
    most_improved_start  = FactoryGirl.create(:batting_statistic, :rbi => 0)
    most_improved_finish = FactoryGirl.create(:batting_statistic, :rbi => 1000)
    most_improved_start_year   = FactoryGirl.create(:stat, :year => 2012, :batting_statistic_id => most_improved_start.id)
    most_improved_finish_year  = FactoryGirl.create(:stat, :year => 2013, :batting_statistic_id => most_improved_finish.id)

    tied_start  = FactoryGirl.create(:batting_statistic, :rbi => 0)
    tied_finish = FactoryGirl.create(:batting_statistic, :rbi => 1000)

    loser_start_year  = FactoryGirl.create(:stat, :year => 2012, :player_id => '2', :batting_statistic_id => tied_start.id)
    loser_finish_year = FactoryGirl.create(:stat, :year => 2013, :player_id => '2', :batting_statistic_id => tied_finish.id)


    most_improved_player = FactoryGirl.create(:player,:player_id => 1, :player_id => 'baberuth')
    tied_player          = FactoryGirl.create(:player,:player_id => 1, :player_id => 'reggiewhite')

    expect(MostImproved.calculate("rbi",2012, 2013, 0)).to eql( "Most improved rbi between 2012-2013 --- 1000 - baberuth and reggiewhite")

  end

  it "should be able to return when noone" do
    expect(MostImproved.calculate("rbi",2012, 2013, 0)).to eql( "Most improved rbi between 2012-2013 --- noone")
  end




end

