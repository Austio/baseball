class BattingStatistic < ActiveRecord::Base
  belongs_to :stat
  has_one :player, through: :stat

  scope :min_ab, ->(at_bats) { where("ab > ?", at_bats) }

  def hits
   (h - double - triple - hr)
  rescue
    0
  end

  def base_count
    hits + (2 * double) + (3 * triple) + (4 * hr)
  rescue
    0
  end

  def slugging_percentage
    (base_count.to_f / ab.to_f).round(3)
  rescue
    0
  end

  def batting_average
    (hits.to_f / ab.to_f).round(3)
  rescue
    0
  end



end
