class CampaignFinanceInfo < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :treasurer
  belongs_to :election_type
  belongs_to :report_type


  has_many :contributions
  has_many :expenditures
  has_many :coh_payments
  has_many :investment_purchases
  has_many :credits
  has_many :loans


  accepts_nested_attributes_for :contributions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :expenditures, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :loans, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :coh_payments, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :investment_purchases, reject_if: :all_blank, allow_destroy: true



end
