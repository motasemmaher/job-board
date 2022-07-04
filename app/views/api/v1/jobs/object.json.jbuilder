json.partial! "/api/v1/lib/meta", collection: @messages
json.data { json.job { json.partial! @job, partial: "job", as: :obj } }
