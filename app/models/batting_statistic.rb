class BattingStatistic < ActiveRecord::Base
  belongs_to :stat
  has_one :player, through: :stat

  scope :min_ab, ->(at_bats) { where("ab > ?", at_bats) }

  def slugging_percentage
    base_count = (h - double - triple - hr) + (2 * double) + (3 * triple) + (4 * hr)
    (base_count.to_f / ab.to_f).round(3)
  rescue
    nil
  end


  #allows for dynamic scoping
  def method_missing(name, args)
    string_name = name.to_s.split('_')
    return super unless ['min','max'].include? string_name.first
    from_mm(name, args)
  end

end
