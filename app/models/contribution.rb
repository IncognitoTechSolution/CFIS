class Contribution < ActiveRecord::Base
  belongs_to :campaign_finance_info
  belongs_to :contribution_type

  validates_presence_of :amount
end
