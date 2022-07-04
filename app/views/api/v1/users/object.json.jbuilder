json.partial! "/api/v1/lib/meta", collection: @messages
json.data { json.user { json.partial! @user, partial: "user", as: :obj } }
