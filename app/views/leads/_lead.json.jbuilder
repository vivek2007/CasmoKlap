json.extract! lead, :id, :name, :sub_category_id, :sub_package_id, :user_id, :employee_id, :status, :created_at, :updated_at
json.url lead_url(lead, format: :json)
