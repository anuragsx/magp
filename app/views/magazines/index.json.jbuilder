json.array!(@magazines) do |magazine|
  json.extract! magazine, :id, :title
  json.url magazine_url(magazine, format: :json)
end
