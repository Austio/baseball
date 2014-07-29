
class MostImproved

  def self.calculate(attribute,start_year,finish_year, at_bats)
    start    = Stat.from_year(start_year).includes(:player).includes(:batting_statistic)
    finish   = Stat.from_year(finish_year).includes(:player).includes(:batting_statistic)
    result = find_max(start, finish,attribute)
    puts "#{result}: Most improved #{attribute} between #{start_year}-#{finish_year}"
  end

  def self.find_max(start, finish, attribute)
    max    = -50000
    player = ''

    start.each do |s|
      f = finish.where(player_id: s.player_id).first
      if f
        improvement = f.batting_statistic.send(attribute) - s.batting_statistic.send(attribute)

        if improvement > max
          player = f.player.name
          max    = improvement
        end

      end
    end

    return "#{max} - #{player}"
  end






end