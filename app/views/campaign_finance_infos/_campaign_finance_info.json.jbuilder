json.extract! campaign_finance_info, :id, :filer_id, :report_type_id, :candidate_id, :treasurer_id, :election_type_id, :sudmitdate, :filename, :campaignyear, :ontime, :periodbegin, :periodend, :electiondate, :created_at, :updated_at
json.url campaign_finance_info_url(campaign_finance_info, format: :json)