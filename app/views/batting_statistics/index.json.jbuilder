json.array!(@batting_statistics) do |batting_statistic|
  json.extract! batting_statistic, :id, :statistic_id, :g, :ab, :r, :h, :2b, :3b, :hr, :rbi, :sb, :cs
  json.url batting_statistic_url(batting_statistic, format: :json)
end
