json.partial! "/api/v1/lib/meta", collection: @messages
json.data { json.auth { json.array! @users, partial: "user", as: :obj } }
