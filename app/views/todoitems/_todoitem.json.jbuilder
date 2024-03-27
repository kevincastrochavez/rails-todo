json.extract! todoitem, :id, :name, :description, :deadline, :completed, :created_at, :updated_at
json.url todoitem_url(todoitem, format: :json)
