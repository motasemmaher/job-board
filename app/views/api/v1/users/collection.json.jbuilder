json.partial! "/api/v1/lib/meta", collection: @messages
json.data { json.users { json.array @users, partial: "user", as: :obj } }
