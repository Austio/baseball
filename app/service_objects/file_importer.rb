class FileImporter
require 'csv'

  attr_reader :file

  def initialize(file)
    @file = "#{Rails.root}/spec/fixtures/Master-small-good.csv"
  end

  def format_column(column)
    column.collect{|line| line.underscore}
  end

  def to_hash(column,line)
    Hash[column.zip line]
  end


end