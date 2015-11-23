json.array!(@importats) do |importat|
  json.extract! importat, :id, :edifici_id
  json.url importat_url(importat, format: :json)
end
