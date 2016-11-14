class Travel < ActiveRecord::Base
  belongs_to :campaign_finance_info
  belongs_to :form_type
end
