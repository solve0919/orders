json.extract! order, :id, :user_id, :name, :postal_code, :prefectures, :ward, :address, :aparatment, :birthday, :settlement, :phone_number, :email, :description, :created_at, :updated_at
json.url order_url(order, format: :json)
