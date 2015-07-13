json.array!(@gas) do |ga|
  json.extract! ga, :id, :edifici_id, :diposit_aire_lliure, :diposit_enterrat
  json.url ga_url(ga, format: :json)
end
