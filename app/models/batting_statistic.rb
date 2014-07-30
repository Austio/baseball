class BattingStatistic < ActiveRecord::Base
  belongs_to :stat
  has_one :player, through: :stat
  has_one :team, through: :stat

  validates :g, :ab, :r, :h, :double, :triple, :hr, :rbi, :sb, :cs, numericality: { greater_than_or_equal_to: 0, allow_nil: false }

  scope :min_ab,      ->(at_bats) { where("ab > ?", at_bats) }
  scope :from_year,   ->(year)    { joins(:stat).where(:stats =>{:year => year}) }
  scope :from_team,   ->(team)    { joins(:team).where(:teams => {:name => team.upcase}) }
  scope :from_league, ->(league)  { joins(:team).where(:teams => {:league => league.upcase}) }
  #BattingStatistic.joins(:team).where(:teams => {:name => "OAK"})


  def singles
   (h - double - triple - hr)
  rescue
    0
  end

  def base_count
    singles + (2 * double) + (3 * triple) + (4 * hr)
  rescue
    0
  end

  def slugging_percentage
    (base_count.to_f / ab.to_f).round(3)
  rescue
    0
  end

  def batting_average
    (h.to_f / ab.to_f).round(3)
  rescue
    0
  end

end
