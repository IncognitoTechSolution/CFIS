class CommitteeType < ActiveRecord::Base
  has_many :committee_notices
end
