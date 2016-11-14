class CommitteeNotice < ActiveRecord::Base
  belongs_to :campaign_finance_info
  belongs_to :committee_type
end
