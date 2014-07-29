class Answers
  def self.answer
    ActiveRecord::Base.logger.level = 1
    Answers.most_improved
    Answers.slugging
    Answers.triple_crown
  end

  def self.slugging
    [2009,2010].each do |year|
      stats = Stat.from_team("OAK").includes(:player).from_year(year).min_ab(200)
      puts "\nOakland #{year} slugging percentage\n"
      stats.each do |stat|
        puts "#{stat.player.name} - #{stat.batting_statistic.slugging_percentage}"
      end
    end
  end

  def self.most_improved
    MostImproved.calculate("batting_average",2009,2011,200)
  end

  def self.triple_crown
    minimum_at_bats = 400
    ["AL","NL"].each do |league|
      [2011,2012].each do |year|
        TripleCrown.calculate(league, year, minimum_at_bats)
      end
    end
  end

end