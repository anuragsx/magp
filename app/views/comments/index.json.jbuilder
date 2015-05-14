json.array!(@comments) do |comment|
  json.extract! comment, :id, :description, :created_by
  json.url comment_url(comment, format: :json)
end
