json.array!(@posts) do |post|
  json.extract! post, :id, :header, :text, :user_id
  json.url post_url(post, format: :json)
end
