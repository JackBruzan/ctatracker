json.extract! schedule, :id, :bustrain, :routeid, :starttime, :endtime, :days, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
