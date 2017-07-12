json.extract! subscriber, :id, :plan_name, :validity, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)
