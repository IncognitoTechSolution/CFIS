json.extract! address, :id, :state_id, :address_type, :address, :suiteapt, :city, :zipcode, :addresschange, :created_at, :updated_at
json.url address_url(address, format: :json)