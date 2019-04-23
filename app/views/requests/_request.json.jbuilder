json.extract! request, :id, :order_id, :contractor_id, :money, :delivery, :quantity, :hope, :note, :receive, :adress, :payment, :status, :created_at, :updated_at
json.url request_url(request, format: :json)
