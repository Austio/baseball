require 'rails_helper'

describe TripleCrown do

  stat_1 = FactoryGirl.build_stubbed(:batting_statistic, :rbi => 500, :ab => 6, :h => 700, :hr => 450)
  stat_2 = FactoryGirl.build_stubbed(:batting_statistic)
  stat_3 = FactoryGirl.build_stubbed(:batting_statistic)
  player_1 = FactoryGirl.build_stubbed(:player, :player_id => '1')
  player_2 = FactoryGirl.build_stubbed(:player, :player_id => '2')
  player_3 = FactoryGirl.build_stubbed(:player, :player_id => '3')


  # before :each do
  #   expect(stat_1).to receive(:player).twice.and_return(player_1)
  #   expect(stat_2).to receive(:player).and_return(player_2)
  #   expect(stat_3).to receive(:player).and_return(player_3)
  #
  # end
  it "should be able to find the max of any stat" do
    expect(stat_1).to receive(:player).twice.and_return(player_1)
    stat = [stat_1,stat_2,stat_3]
    expect(TripleCrown.find_max(stat,"rbi")).to eql([stat_1.player.name])
  end

  it "should return the triple crown winner" do
    stat = [stat_1,stat_2,stat_3]
    expect(TripleCrown).to receive(:find_max).with(stat, "rbi").and_return(['1'])
    expect(TripleCrown).to receive(:find_max).with(stat, "hr").and_return(['1'])
    expect(TripleCrown).to receive(:find_max).with(stat, "batting_average").and_return(['1'])


    expect(TripleCrown.find_crown(stat)).to eql('1')

  end

  it "should return no matches when no triple crown winner" do
    stat = [stat_1,stat_2,stat_3]
    expect(TripleCrown).to receive(:find_max).with(stat, "rbi").and_return(['1'])
    expect(TripleCrown).to receive(:find_max).with(stat, "hr").and_return(['2'])
    expect(TripleCrown).to receive(:find_max).with(stat, "batting_average").and_return(['1'])


    expect(TripleCrown.find_crown(stat)).to eql("(NO MATCHES)")
  end



end

