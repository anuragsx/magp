json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :user_id, :deadline
  json.url article_url(article, format: :json)
end
