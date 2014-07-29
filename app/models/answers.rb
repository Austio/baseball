class Answers
  def answer
    Answers.slugging
    Answers.most_improved

  end

  def self.slugging
    stats = Stat.from_team("OAK").includes(:batting_statistic).includes(:player)
    puts "Player - Slugging Percentage"
    stats.each do |stat|
      puts "#{stat.player.name} - #{stat.batting_statistic.slugging_percentage}"
    end
  end

  def self.most_improved
    MostImproved.calculate("batting_average",2009,2011,200)
  end

end