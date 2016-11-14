class CampaignFinanceInfo < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :treasurer
  belongs_to :election_type
  belongs_to :report_type
  belongs_to :user


  has_many :contributions
  has_many :expenditures
  has_many :coh_payments
  has_many :investment_purchases
  has_many :credits
  has_many :loans
  has_many :committee_notices
  has_many :travels


  accepts_nested_attributes_for :contributions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :expenditures, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :loans, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :coh_payments, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :investment_purchases, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :credits, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :committee_notices, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :travels, reject_if: :all_blank, allow_destroy: true



end
