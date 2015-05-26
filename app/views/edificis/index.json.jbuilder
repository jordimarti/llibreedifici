json.array!(@edificis) do |edifici|
  json.extract! edifici, :id, :user_id, :nom_edifici, :tipus_edifici
  json.url edifici_url(edifici, format: :json)
end
