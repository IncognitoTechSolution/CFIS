json.extract! contribution, :id, :campaign_finance_info_id, :contribution_type_id, :prefix_id, :entity_type_id, :contributorname, :address, :city, :state_id, :zip, :amount, :date, :description, :isoutofstatepac, :pacid, :istraveloutsidetx, :created_at, :updated_at
json.url contribution_url(contribution, format: :json)