json.array!(@issues) do |issue|
  json.extract! issue, :id, :image, :pdf_file_name, :print_deadline
  json.url issue_url(issue, format: :json)
end
