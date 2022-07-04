json.partial! "/api/v1/lib/meta", collection: @messages
json.data { json.applications { json.array! @applications, partial: "application", as: :obj } }
