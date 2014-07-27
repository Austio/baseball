# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

player_file = "Master-small.csv"

BattingImporter.new("#{Rails.root}/lib/statistics/Batting-07-12.csv").parse_csv
PlayerImporter.new("#{Rails.root}/spec/fixtures/Master-small.csv").parse_csv

