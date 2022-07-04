json.partial! "/api/v1/lib/meta", collection: @messages
json.data { json.jobs { json.array @jobs, partial: "job", as: :obj } }
