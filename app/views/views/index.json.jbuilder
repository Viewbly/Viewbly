json.array!(@views) do |view|
  json.extract! view, :id, :name, :content
  json.url view_url(view, format: :json)
end
