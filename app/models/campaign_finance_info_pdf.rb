class CampaignFinanceInfoPdf < Prawn::Document
  def initialize(campaign_finance_info, by)
    super(top_margin: 70)
    @campaign_finance_info = campaign_finance_info
    table_rows = []
    # by is passed from the link in results, to CFI show action, to here. It will be candidate or treasurer, based upon what you searched on. It decides which table type to show
    if by == 'candidate'
      table_rows <<  ['Candidate First Name','Candidate Last Name','Contribution Amount']
      campaign_finance_info.contributions.map do |contribution|
        table_rows << [campaign_finance_info.candidate.firstname,campaign_finance_info.candidate.lastname, contribution.amount]
      end
    elsif by == 'treasurer'
      table_rows <<  ['Treasurer First Name','Treasurer Last Name','Candidate First Name','Candidate Last Name','Contribution Amount']
      campaign_finance_info.contributions.map do |contribution|
        table_rows << [campaign_finance_info.treasurer.firstname,campaign_finance_info.treasurer.lastname, campaign_finance_info.candidate.firstname,campaign_finance_info.candidate.lastname, contribution.amount]
      end
    end
    #table is a method provided by Prawn::Table
    table([[table_rows]], position: :center)
  end
end