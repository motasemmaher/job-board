json.success false
json.messages @messages
json.errors do
  json.array! @errors do |e|
    json.code nil
    json.path nil
    json.message e.message
  end
end
