json.array!(@japas) do |japa|
  json.extract! japa, :id, :rounds, :comment, :user_id
  json.url japa_url(japa, format: :json)
end
