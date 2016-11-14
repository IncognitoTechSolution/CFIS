class Filer < ActiveRecord::Base
  belongs_to :campaign_finance_info
  belongs_to :filer_type
  belongs_to :prefix
  belongs_to :office_sought
  belongs_to :office_held

  validates_presence_of :firstname
end
