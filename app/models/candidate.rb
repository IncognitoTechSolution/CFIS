class Candidate < ActiveRecord::Base
  has_many :campaign_finance_infos
end
