json.extract! expenditure, :id, :campaign_finance_info_id, :expend_type_id, :expend_category_id, :payment_method_id, :prefix_id, :entity_type_id, :contributorname, :address, :city, :state_id, :zip, :amount, :date, :description, :isbenefitCOH, :istraveloutsidetx, :isreimbursementintended, :created_at, :updated_at
json.url expenditure_url(expenditure, format: :json)