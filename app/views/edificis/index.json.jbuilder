json.array!(@edificis) do |edifici|
  json.extract! edifici, :id, :user_id, :nom
  json.url edifici_url(edifici, format: :json)
end
