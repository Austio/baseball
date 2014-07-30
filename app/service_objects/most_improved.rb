
class MostImproved

  def self.calculate(attribute,start_year,finish_year, at_bats=0)
    start    = BattingStatistic.from_year(start_year).min_ab(at_bats)
    finish   = Stat.from_year(finish_year).includes(:player).min_ab(at_bats)
    result = find_max(start, finish,attribute,at_bats)
    puts "Most improved #{attribute} between #{start_year}-#{finish_year} --- #{result}"
  end

  def self.find_max(start, finish, attribute, at_bats)
    max    = 0
    player = 'noone'

    start.each do |s|
      f = finish.where(player_id: s.player_id).first
      if f
        improvement = f.batting_statistic.send(attribute) - s.batting_statistic.send(attribute)

        if improvement > max
          player = f.player.name
          max    = improvement
        elsif improvement == max
          player += " and #{f.player.name}"
        end

      end
    end

    return "#{max} - #{player}"
  end






end