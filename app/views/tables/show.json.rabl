object @table
attributes :id

child :reservations do
  attributes :id, :table_id
  node(:start_time) { |r|(r.start_time).strftime("%Y/%m/%d %l:%M:%S")}
  node(:end_time) { |r|(r.end_time).strftime("%Y/%m/%d %l:%M:%S")}
end