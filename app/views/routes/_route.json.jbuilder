json.extract! route, :id, :routeid, :routeName, :created_at, :updated_at
json.url route_url(route, format: :json)
