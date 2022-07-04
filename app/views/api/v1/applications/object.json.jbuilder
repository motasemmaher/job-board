json.partial! "/api/v1/lib/meta", collection: @messages
json.data { json.application { json.partial! @application, partial: "application", as: :obj } }
