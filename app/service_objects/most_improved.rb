class MostImproved

  def self.calculate(attribute,start_year,finish_year, at_bats=0)
    start_stats  = BattingStatistic.from_year(start_year).min_ab(at_bats).includes(:stat)
    finish_stats = BattingStatistic.from_year(finish_year).min_ab(at_bats).includes(:stat)
    result = find_max(start_stats, finish_stats,attribute)
    display = format_results(result)
    return "Most improved #{attribute} between #{start_year}-#{finish_year} --- #{display}"
  end

  def self.find_max(start, finish, attribute)
    max = 0
    stat = []

    start.each do |s|
      f = find_second_year(s.stat.player_id, finish)
      if f
        improvement = f.send(attribute) - s.send(attribute)

        if improvement > max
          stat = [f]
          max = improvement
        elsif improvement == max
          stat << f
        end

      end
    end
    [max,stat]
  end

  def self.format_results(result)
    case result.second.count
      when 0
        "noone"
      when 1
        "#{result.first} - #{result.second.first.player.name}"
      else
        result.second.collect!{|r| r.player.name}
        "#{result.first} - #{result.second.join(" and ")}"
    end
  end

  def self.find_second_year(player_id, finish_stats)
    finish_stats.each do |f|
      return f if f.stat.player_id == player_id
    end
    nil
  end



#
# class MostImproved
#
#   def self.calculate(attribute,start_year,finish_year, at_bats=0)
#     start    = BattingStatistic.from_year(start_year).min_ab(at_bats)
#     finish   = Stat.from_year(finish_year).includes(:player).min_ab(at_bats)
#     result = find_max(start, finish,attribute,at_bats)
#     puts "Most improved #{attribute} between #{start_year}-#{finish_year} --- #{result}"
#   end
#
#   def self.find_max(start_stats, finish_stats, attribute, at_bats)
#     max         = 0
#     bat_stat_id = []
#
#     start_stats.each do |start|
#       finish = finish_stats.select{|finish| finish.first == start.first}
#       unless finish.empty?
#         improvement = finish.second - start.second
#
#         if improvement > max
#           bat_stat_id = [finish.first]
#           max         = improvement
#         elsif improvement == max
#           bat_stat_id << finish.first
#         end
#
#       end
#     end
#
#     return  [bat_stat_id,max]
#   end






end