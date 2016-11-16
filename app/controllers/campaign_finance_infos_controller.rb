class CampaignFinanceInfosController < ApplicationController
  before_action :set_campaign_finance_info, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:index, :show]
  # GET /campaign_finance_infos
  # GET /campaign_finance_infos.json
  def index
    @campaign_finance_infos = CampaignFinanceInfo.all
  end

  # GET /campaign_finance_infos/1
  # GET /campaign_finance_infos/1.json
  def show
    @campaign_finance_info = CampaignFinanceInfo.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CampaignFinanceInfoPdf.new(@campaign_finance_info, params[:by])
        send_data pdf.render, filename: "CampaignInfo.pdf",
                  type: "application/pdf",
                  disposition: "inline"
      end
    end
  end

  # GET /campaign_finance_infos/new
  def new
    @campaign_finance_info = current_user.campaign_finance_infos.build
  end

  # GET /campaign_finance_infos/1/edit
  def edit
  end

  # POST /campaign_finance_infos
  # POST /campaign_finance_infos.json
  def create
    @campaign_finance_info = current_user.campaign_finance_infos.build(campaign_finance_info_params)

    if params[:commit] == 'Export'

      require 'yaml'
      require 'date'

      # Parameters from the Main Portion of Campaign Finance Report.

      @filename = params[:campaign_finance_info][:filename]
      @report_type_id = params[:campaign_finance_info][:report_type_id]
      @filer_id = params[:campaign_finance_info][:filer_id]
      @candidate_id = params[:campaign_finance_info][:candidate_id]
      @treasurer_id = params[:campaign_finance_info][:treasurer_id]
      @election_type_id = params[:campaign_finance_info][:election_type_id]
      @campaign_year = params[:campaign_finance_info][:campaignyear]

      @on_time = params[:campaign_finance_info][:ontime]
      $ontime = @on_time

      @noticecheck = params[:campaign_finance_info][:noticecheck]
      $noticecheck = @noticecheck

      @contributioncheck = params[:campaign_finance_info][:contributioncheck]
      $contributioncheck = @contributioncheck

      @expenditurecheck = params[:campaign_finance_info][:expenditurecheck]
      $expenditurecheck = @expenditurecheck

      @loancheck = params[:campaign_finance_info][:loancheck]
      $loancheck = @loancheck

      @paytocohcheck = params[:campaign_finance_info][:paytocohcheck]
      $paytocohcheck = @paytocohcheck

      @creditcheck = params[:campaign_finance_info][:creditcheck]
      $creditcheck = @creditcheck

      @travelcheck = params[:campaign_finance_info][:travelcheck]
      $travelcheck = @travelcheck

      @investmentcheck = params[:campaign_finance_info][:investmentcheck]
      $investmentcheck = @investmentcheck

      submitday = params[:campaign_finance_info][:'sudmitdate(3i)'].to_i
      submitmonth = params[:campaign_finance_info][:'sudmitdate(2i)'].to_i
      submityear = params[:campaign_finance_info][:'sudmitdate(1i)'].to_i
      @submit_date = Date.new(submityear, submitmonth, submitday)

      beginday = params[:campaign_finance_info][:'periodbegin(3i)'].to_i
      beginmonth = params[:campaign_finance_info][:'periodbegin(2i)'].to_i
      beginyear = params[:campaign_finance_info][:'periodbegin(1i)'].to_i
      @begin_period = Date.new(beginyear, beginmonth, beginday)

      endday = params[:campaign_finance_info][:'periodend(3i)'].to_i
      endmonth = params[:campaign_finance_info][:'periodend(2i)'].to_i
      endyear = params[:campaign_finance_info][:'periodend(1i)'].to_i
      @end_period = Date.new(endyear, endmonth, endday)

      electionday = params[:campaign_finance_info][:'electiondate(3i)'].to_i
      electionmonth = params[:campaign_finance_info][:'electiondate(2i)'].to_i
      electionyear = params[:campaign_finance_info][:'electiondate(1i)'].to_i
      @election_date = Date.new(electionyear, electionmonth, electionday)


      file_path = File.join(Rails.root, 'cfinfo.yml')
      output = File.new(file_path, 'w')
      @campaign_finance_info = {'campaign_finance_info' => {'filer_id' => @filer_id, 'report_type_id' => @report_type_id,
                                                            'candidate_id' => @candidate_id, 'treasurer_id' => @treasurer_id,
                                                            'election_type_id' => @election_type_id, 'filename' => @filename,
                                                            'campaignyear' => @campaign_year, 'ontime' => @on_time,
                                                            'sudmitdate' => @submit_date, 'periodbegin' => @begin_period,
                                                            'periodend' => @end_period, 'electiondate' => @election_date,
      'noticecheck' => @noticecheck, 'contributioncheck' => @contributioncheck, 'expenditurecheck' => @expenditurecheck,
      'loancheck' => @loancheck, 'paytocohcheck' => @paytocohcheck, 'creditcheck' => @creditcheck, 'travelcheck' => @travelcheck,
      'investmentcheck' => @investmentcheck}}

      output.puts YAML.dump(@campaign_finance_info)

      # Parameters pulled from the Contributors section.

      $key = 0

      if params[:campaign_finance_info][:contributioncheck] == '0'

        @key_value = $key.to_s
        puts @key_value

        @prefix_id = params[:campaign_finance_info][:contributions_attributes][@key_value][:prefix_id]
        @entity_type_id = params[:campaign_finance_info][:contributions_attributes][@key_value][:entity_type_id]

        day = params[:campaign_finance_info][:contributions_attributes][@key_value][:'date(3i)'].to_i
        month = params[:campaign_finance_info][:contributions_attributes][@key_value][:'date(2i)'].to_i
        year = params[:campaign_finance_info][:contributions_attributes][@key_value][:'date(1i)'].to_i
        @contribution_date = Date.new(year, month, day)

        @contributor_name = params[:campaign_finance_info][:contributions_attributes][@key_value][:contributorname]
        @contributor_address = params[:campaign_finance_info][:contributions_attributes][@key_value][:address]
        @contributor_city = params[:campaign_finance_info][:contributions_attributes][@key_value][:city]
        @contributor_state = params[:campaign_finance_info][:contributions_attributes][@key_value][:state_id]
        @contributor_zip = params[:campaign_finance_info][:contributions_attributes][@key_value][:zip]

        @contribution_amount = params[:campaign_finance_info][:contributions_attributes][@key_value][:amount]


        @contribution_description = params[:campaign_finance_info][:contributions_attributes][@key_value][:description]
        @outofstatepac = params[:campaign_finance_info][:contributions_attributes][@key_value][:isoutofstatepac]
        $outofstatepac = @outofstatepac

        @pac_id = params[:campaign_finance_info][:contributions_attributes][@key_value][:pacid]

        @traveloutsidetx = params[:campaign_finance_info][:contributions_attributes][@key_value][:istraveloutsidetx]
        $traveloutsidetx = @traveloutsidetx

        @contributions = {'contributions' => {@key_value => {'prefix_id' => @prefix_id, 'entity_type_id' => @entity_type_id,
                                                             'contributorname' => @contributor_name, 'address' => @contributor_address,
                                                             'city' => @contributor_city, 'state_id' => @contributor_state,
                                                             'zip' => @contributor_zip, 'amount' => @contribution_amount,
                                                             'date' => @contribution_date, 'description' => @contribution_description,
                                                             'isoutofstatepac' => @outofstatepac, 'pacid' => @pac_id,
                                                             'istraveloutsidetx' => @traveloutsidetx}}}

        output.puts YAML.dump(@contributions)

        $key += 1

      end

      # Parameters pulled from the Expenditures section.

      if params[:campaign_finance_info][:expenditurecheck] == '0'

      @expenditures_key = $key

        @key_value = @expenditures_key.to_s
        puts @key_value

        @expend_type_id = params[:campaign_finance_info][:expenditures_attributes][@key_value][:expend_type_id]
        @expend_category_id = params[:campaign_finance_info][:expenditures_attributes][@key_value][:expend_category_id]
        @payment_method_id = params[:campaign_finance_info][:expenditures_attributes][@key_value][:payment_method_id]
        @e_prefix_id = params[:campaign_finance_info][:expenditures_attributes][@key_value][:prefix_id]
        @e_entity_type_id = params[:campaign_finance_info][:expenditures_attributes][@key_value][:entity_type_id]

        @e_contributor_name = params[:campaign_finance_info][:expenditures_attributes][@key_value][:contributorname]
        @e_contributor_address = params[:campaign_finance_info][:expenditures_attributes][@key_value][:address]
        @e_contributor_city = params[:campaign_finance_info][:expenditures_attributes][@key_value][:city]
        @e_contributor_state = params[:campaign_finance_info][:expenditures_attributes][@key_value][:state_id]
        @e_contributor_zip = params[:campaign_finance_info][:expenditures_attributes][@key_value][:zip]

        @e_contribution_amount = params[:campaign_finance_info][:expenditures_attributes][@key_value][:amount]

        day = params[:campaign_finance_info][:expenditures_attributes][@key_value][:'date(3i)'].to_i
        month = params[:campaign_finance_info][:expenditures_attributes][@key_value][:'date(2i)'].to_i
        year = params[:campaign_finance_info][:expenditures_attributes][@key_value][:'date(1i)'].to_i
        @e_contribution_date = Date.new(year, month, day)

        @e_contribution_description = params[:campaign_finance_info][:expenditures_attributes][@key_value][:description]
        @e_isbenefitCOH = params[:campaign_finance_info][:expenditures_attributes][@key_value][:isbenefitCOH]
        $e_isbenefitCOH = @e_isbenefitCOH

        @e_traveloutsidetx = params[:campaign_finance_info][:expenditures_attributes][@key_value][:istraveloutsidetx]
        $traveloutsidetx = @e_traveloutsidetx

        @e_isreimbursementintended = params[:campaign_finance_info][:expenditures_attributes][@key_value][:isreimbursementintended]
        $isreimbursementintended = @e_isreimbursementintended

        @expenditures = {'expenditures' => {@expenditures_key => {'expend_type_id' => @expend_type_id, 'expend_category_id' => @expend_category_id,
                                                                  'payment_method_id' => @payment_method_id, 'prefix_id' => @e_prefix_id,
                                                                  'entity_type_id' => @e_entity_type_id, 'contributorname' => @e_contributor_name,
                                                                  'address' => @e_contributor_address, 'city' => @e_contributor_city,
                                                                  'state_id' => @e_contributor_state,
                                                                  'zip' => @e_contributor_zip, 'amount' => @e_contribution_amount,
                                                                  'date' => @e_contribution_date, 'description' => @e_contribution_description,
                                                                  'isbenefitCOH' => @e_isbenefitCOH, 'istraveloutsidetx' => @e_traveloutsidetx,
                                                                  'isreimbursementintended' => @e_isreimbursementintended}}}

        output.puts YAML.dump(@expenditures)

        $key += 1

      end

      # Parameters pulled from the Loans section.

      if params[:campaign_finance_info][:loancheck] == '0'

      @lenders_key = $key

        @key_value = @lenders_key.to_s
        puts @key_value

        @l_prefix_id = params[:campaign_finance_info][:loans_attributes][@key_value][:prefix_id]
        @l_entity_type_id = params[:campaign_finance_info][:loans_attributes][@key_value][:entity_type_id]
        @lendername = params[:campaign_finance_info][:loans_attributes][@key_value][:lendername]

        @l_contributor_address = params[:campaign_finance_info][:loans_attributes][@key_value][:address]
        @l_contributor_city = params[:campaign_finance_info][:loans_attributes][@key_value][:city]
        @l_contributor_state = params[:campaign_finance_info][:loans_attributes][@key_value][:state_id]
        @l_contributor_zip = params[:campaign_finance_info][:loans_attributes][@key_value][:zip]

        @isfinancialinstitution = params[:campaign_finance_info][:loans_attributes][@key_value][:isfinancialinstitution]
        $isfinancialinstitution = @isfinancialinstitution

        @l_outofstatepac = params[:campaign_finance_info][:loans_attributes][@key_value][:isoutofstatepac]
        $l_outofstatepac = @l_outofstatepac

        @l_pac_id = params[:campaign_finance_info][:loans_attributes][@key_value][:pacid]
        @l_amount = params[:campaign_finance_info][:loans_attributes][@key_value][:amount]

        @interestrate = params[:campaign_finance_info][:loans_attributes][@key_value][:interestrate]

        day = params[:campaign_finance_info][:loans_attributes][@key_value][:'date(3i)'].to_i
        month = params[:campaign_finance_info][:loans_attributes][@key_value][:'date(2i)'].to_i
        year = params[:campaign_finance_info][:loans_attributes][@key_value][:'date(1i)'].to_i
        @l_date = Date.new(year, month, day)


        day = params[:campaign_finance_info][:loans_attributes][@key_value][:'maturitydate(3i)'].to_i
        month = params[:campaign_finance_info][:loans_attributes][@key_value][:'maturitydate(2i)'].to_i
        year = params[:campaign_finance_info][:loans_attributes][@key_value][:'maturitydate(1i)'].to_i
        @maturitydate = Date.new(year, month, day)

        @collateraldescription = params[:campaign_finance_info][:loans_attributes][@key_value][:collateraldescription]

        @ispersonalfunddeposit = params[:campaign_finance_info][:loans_attributes][@key_value][:ispersonalfunddeposit]
        $ispersonalfunddeposit = @ispersonalfunddeposit

        @guarantor = params[:campaign_finance_info][:loans_attributes][@key_value][:guarantor]
        @amountguaranteed = params[:campaign_finance_info][:loans_attributes][@key_value][:amountguaranteed]


        @loans = {'loans' => {@lenders_key => {'prefix_id' => @l_prefix_id, 'entity_type_id' => @l_entity_type_id,
                                                                  'lendername' => @lendername, 'address' => @l_contributor_address,
                                                                  'city' => @l_contributor_city, 'state_id' => @l_contributor_state,
                                                                  'zip' => @l_contributor_zip,
                                                                  'isfinancialinstitution' => @isfinancialinstitution,
                                                                  'isoutofstatepac' => @l_outofstatepac,
                                                                  'pacid' => @l_pac_id,
                                                                  'amount' => @l_amount,
                                                                  'interestrate' => @interestrate,
                                                                  'date' => @l_date, 'maturitydate' => @maturitydate,
                                                                  'collateraldescription' => @collateraldescription,
                                                                  'ispersonalfunddeposit' => @ispersonalfunddeposit,
                                                                  'guarantor' => @guarantor,
                                                                  'amountguaranteed' => @amountguaranteed}}}

        output.puts YAML.dump(@loans)

        $key += 1
      end

      # Parameters pulled from the Payment From Political Contribution to a Business of C/OH section.

      if params[:campaign_finance_info][:paytocohcheck] == '0'

      @coh_key = $key

        @key_value = @coh_key.to_s
        puts @key_value

        @c_prefix_id = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:prefix_id]
        @c_entity_type_id = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:entity_type_id]
        @c_expend_category_id = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:expend_category_id]

        @businessname = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:businessname]

        @c_contributor_address = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:address]
        @c_contributor_city = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:city]
        @c_contributor_state = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:state_id]
        @c_contributor_zip = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:zip]

        @c_amount = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:amount]

        day = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:'date(3i)'].to_i
        month = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:'date(2i)'].to_i
        year = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:'date(1i)'].to_i
        @c_date = Date.new(year, month, day)

        @c_description = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:description]

        @c_isbenefitcoh = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:isbenefitcoh]
        $c_isbenefitcoh = @c_isbenefitcoh

        @c_istraveloutsidetx = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:istraveloutsidetx]
        $c_istraveloutsidetx = @c_istraveloutsidetx

        @c_isaustintxlivingexpense = params[:campaign_finance_info][:coh_payments_attributes][@key_value][:isaustintxlivingexpense]
        $c_isaustintxlivingexpense = @c_isaustintxlivingexpense


        @coh_payments = {'coh_payments' => {@coh_key => {'prefix_id' => @c_prefix_id, 'entity_type_id' => @c_entity_type_id,
                                                  'expend_category_id' => @c_expend_category_id,
                                               'businessname' => @businessname, 'address' => @c_contributor_address,
                                               'city' => @c_contributor_city, 'state_id' => @c_contributor_state,
                                               'zip' => @c_contributor_zip,
                                               'amount' => @c_amount,
                                               'date' => @c_date,
                                               'description' => @c_description,
                                               'isbenefitcoh' => @c_isbenefitcoh,
                                               'istraveloutsidetx' => @c_istraveloutsidetx,
                                               'isaustintxlivingexpense' => @c_isaustintxlivingexpense}}}

        output.puts YAML.dump(@coh_payments)

        $key += 1
      end

      # Parameters pulled from the Purchase of Investments Section.

      if params[:campaign_finance_info][:investmentcheck] == '0'

      @investment_key = $key

        @key_value = @investment_key.to_s
        puts @key_value

        @i_prefix_id = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:prefix_id]
        @i_entity_type_id = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:entity_type_id]

        @investorname = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:investorname]

        @i_contributor_address = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:address]
        @i_contributor_city = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:city]
        @i_contributor_state = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:state_id]
        @i_contributor_zip = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:zip]

        @i_amount = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:amount]

        day = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:'date(3i)'].to_i
        month = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:'date(2i)'].to_i
        year = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:'date(1i)'].to_i
        @i_date = Date.new(year, month, day)

        @i_description = params[:campaign_finance_info][:investment_purchases_attributes][@key_value][:description]


        @investments = {'investments' => {@investment_key => {'prefix_id' => @i_prefix_id, 'entity_type_id' => @i_entity_type_id,
                                                  'investorname' => @investorname, 'address' => @i_contributor_address,
                                                  'city' => @i_contributor_city, 'state_id' => @i_contributor_state,
                                                  'zip' => @i_contributor_zip,
                                                  'amount' => @i_amount,
                                                  'date' => @i_date, 'description' => @i_description}}}

        output.puts YAML.dump(@investments)

        $key += 1

      end


      # Parameters pulled from the Credits Section.

      if params[:campaign_finance_info][:creditcheck] == '0'

      @credits_key = $key

        @key_value = @credits_key.to_s
        puts @key_value

        @cr_prefix_id = params[:campaign_finance_info][:credits_attributes][@key_value][:prefix_id]
        @cr_entity_type_id = params[:campaign_finance_info][:credits_attributes][@key_value][:entity_type_id]

        @creditorname = params[:campaign_finance_info][:credits_attributes][@key_value][:creditorname]

        @cr_contributor_address = params[:campaign_finance_info][:credits_attributes][@key_value][:address]
        @cr_contributor_city = params[:campaign_finance_info][:credits_attributes][@key_value][:city]
        @cr_contributor_state = params[:campaign_finance_info][:credits_attributes][@key_value][:state_id]
        @cr_contributor_zip = params[:campaign_finance_info][:credits_attributes][@key_value][:zip]

        @cr_amount = params[:campaign_finance_info][:credits_attributes][@key_value][:amount]

        day = params[:campaign_finance_info][:credits_attributes][@key_value][:'date(3i)'].to_i
        month = params[:campaign_finance_info][:credits_attributes][@key_value][:'date(2i)'].to_i
        year = params[:campaign_finance_info][:credits_attributes][@key_value][:'date(1i)'].to_i
        @cr_date = Date.new(year, month, day)

        @cr_purpose = params[:campaign_finance_info][:credits_attributes][@key_value][:purpose]

        @cr_isreturnedtofiler = params[:campaign_finance_info][:credits_attributes][@key_value][:isreturnedtofiler]
        $cr_isreturnedtofiler = @cr_isreturnedtofiler

        @credits = {'credits' => {@credits_key => {'prefix_id' => @cr_prefix_id, 'entity_type_id' => @cr_entity_type_id,
                                                              'creditorname' => @creditorname, 'address' => @cr_contributor_address,
                                                              'city' => @cr_contributor_city, 'state_id' => @cr_contributor_state,
                                                              'zip' => @cr_contributor_zip,
                                                              'amount' => @cr_amount,
                                                              'date' => @cr_date, 'purpose' => @cr_purpose}}}

        output.puts YAML.dump(@credits)

        $key += 1
      end

      # Parameters pulled from the Committee Notice Section.

      if params[:campaign_finance_info][:noticecheck] == '0'

      @committee_key = $key

        @key_value = @committee_key.to_s
        puts @key_value

        @com_committee_type_id = params[:campaign_finance_info][:committee_notices_attributes][@key_value][:committee_type_id]

        @com_name = params[:campaign_finance_info][:committee_notices_attributes][@key_value][:name]

        @com_contributor_address = params[:campaign_finance_info][:committee_notices_attributes][@key_value][:address]
        @com_contributor_city = params[:campaign_finance_info][:committee_notices_attributes][@key_value][:city]
        @com_contributor_state = params[:campaign_finance_info][:committee_notices_attributes][@key_value][:state_id]
        @com_contributor_zip = params[:campaign_finance_info][:committee_notices_attributes][@key_value][:zip]


        @committees = {'committee' => {@committee_key => {'committee_type_id' => @com_committee_type_id,
                                                   'name' => @com_name, 'address' => @com_contributor_address,
                                                   'city' => @com_contributor_city, 'state_id' => @com_contributor_state,
                                                   'zip' => @com_contributor_zip,}}}

        output.puts YAML.dump(@committees)

        @committee_key += 1
        @committee_count += 1
        $key += 1
      end

      # Parameters pulled from the Travel Section. (Continue from here)

      if params[:campaign_finance_info][:travelcheck] == '0'

      @travel_key = $key

        @key_value = @travel_key.to_s
        puts @key_value

        @t_form_type_id = params[:campaign_finance_info][:travels_attributes][@key_value][:form_type_id]

        @t_name = params[:campaign_finance_info][:travels_attributes][@key_value][:name]

        day = params[:campaign_finance_info][:travels_attributes][@key_value][:'travelbegin(3i)'].to_i
        month = params[:campaign_finance_info][:travels_attributes][@key_value][:'travelbegin(2i)'].to_i
        year = params[:campaign_finance_info][:travels_attributes][@key_value][:'travelbegin(1i)'].to_i
        @t_begindate = Date.new(year, month, day)

        day = params[:campaign_finance_info][:travels_attributes][@key_value][:'travelend(3i)'].to_i
        month = params[:campaign_finance_info][:travels_attributes][@key_value][:'travelend(2i)'].to_i
        year = params[:campaign_finance_info][:travels_attributes][@key_value][:'travelend(1i)'].to_i
        @t_enddate = Date.new(year, month, day)

        @t_prefix_id = params[:campaign_finance_info][:travels_attributes][@key_value][:prefix_id]
        @travelername = params[:campaign_finance_info][:travels_attributes][@key_value][:travelername]
        @departureloc = params[:campaign_finance_info][:travels_attributes][@key_value][:departureloc]
        @destinationloc = params[:campaign_finance_info][:travels_attributes][@key_value][:destinationloc]
        @transportation = params[:campaign_finance_info][:travels_attributes][@key_value][:transportation]
        @t_purpose = params[:campaign_finance_info][:travels_attributes][@key_value][:purpose]


        @committees = {'committee' => {@committee_key => {'form_type_id' => @t_form_type_id,
                                                          'name' => @t_name, 'travelbegin' => @t_begindate,
                                                          'travelend' => @t_enddate, 'prefix_id' => @t_prefix_id,
                                                          'travelername' => @travelername,
                                                          'departureloc' => @departureloc, 'departureloc' => @destinationloc,
                                                          'transportation' => transportation, 'purpose' => @t_purpose}}}

        output.puts YAML.dump(@committees)
      end


      # Prompts user where to save YAML file to client computer.
      send_file file_path, :type => 'text/yaml', :disposition => 'attachment'

      output.close

      flash[:notice] = 'Campaign finance info was successfully exported.'

    elsif params[:commit] == 'Submit'

      respond_to do |format|
        if @campaign_finance_info.save
          format.html { redirect_to @campaign_finance_info, notice: 'Campaign finance info was successfully created.' }
          format.json { render :show, status: :created, location: @campaign_finance_info }
        else
          format.html { render :new }
          format.json { render json: @campaign_finance_info.errors, status: :unprocessable_entity }
        end
        end

    elsif params[:commit] == 'Import'

      require 'yaml'
      text = YAML.load_file('cfinfo.yml')
      puts text

      $filer_id = text['campaign_finance_info']['filer_id']
      $report_type_id = text['campaign_finance_info']['report_type_id']
      $candidate_id = text['campaign_finance_info']['candidate_id']
      $treasurer_id = text['campaign_finance_info']['treasurer_id']
      $election_type_id = text['campaign_finance_info']['election_type_id']
      $filename = text['campaign_finance_info']['filename']
      $campaign_year = text['campaign_finance_info']['campaignyear']
      $ontime = text['campaign_finance_info']['ontime']
      $contribution_status = text['campaign_finance_info']['contributioncheck']
      $sub_date = text['campaign_finance_info']['sudmitdate']
      $begin_date = text['campaign_finance_info']['periodbegin']
      $end_date = text['campaign_finance_info']['periodend']
      $election_day = text['campaign_finance_info']['electiondate']

      flash[:notice] = 'Campaign finance info was successfully imported.'
      redirect_to request.referer

  end
end

  # PATCH/PUT /campaign_finance_infos/1
  # PATCH/PUT /campaign_finance_infos/1.json
  def update
    respond_to do |format|
      if @campaign_finance_info.update(campaign_finance_info_params)
        format.html { redirect_to @campaign_finance_info, notice: 'Campaign finance info was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign_finance_info }
      else
        format.html { render :edit }
        format.json { render json: @campaign_finance_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_finance_infos/1
  # DELETE /campaign_finance_infos/1.json
  def destroy
    @campaign_finance_info.destroy
    respond_to do |format|
      format.html { redirect_to campaign_finance_infos_url, notice: 'Campaign finance info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
  end

  def results
    unless params[:candidate_first_name].empty? && params[:candidate_last_name].empty? && params[:treasurer_first_name].empty? && params[:treasurer_last_name].empty?
      @by_candidate = CampaignFinanceInfo.joins(:candidate).search_by_first_name(params[:candidate_first_name]) if params[:candidate_first_name].present?
      @by_candidate = CampaignFinanceInfo.joins(:candidate).search_by_last_name(params[:candidate_last_name]) if params[:candidate_last_name].present?

      @by_treasurer = CampaignFinanceInfo.joins(:treasurer).search_by_first_name(params[:treasurer_first_name]) if params[:treasurer_first_name].present?
      @by_treasurer = CampaignFinanceInfo.joins(:treasurer).search_by_last_name(params[:treasurer_last_name]) if params[:treasurer_last_name].present?
    else
      @empty = true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_finance_info
      @campaign_finance_info = CampaignFinanceInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_finance_info_params
      params.require(:campaign_finance_info).permit(:filer_id, :report_type_id, :candidate_id, :treasurer_id, :election_type_id, :sudmitdate, :filename, :campaignyear, :ontime, :periodbegin, :periodend, :electiondate,
                                                    contributions_attributes: [:id,:campaign_finance_info_id,
                                                                           :contribution_type_id,
                                                                           :prefix_id,
                                                                           :entity_type_id,
                                                                           :contributorname,
                                                                           :address,
                                                                           :city,
                                                                           :state_id,
                                                                           :zip,
                                                                           :amount,
                                                                           :date,
                                                                           :description,
                                                                           :isoutofstatepac,
                                                                           :pacid,
                                                                           :istraveloutsidetx,:_destroy],
                                                  expenditures_attributes: [:id,:campaign_finance_info_id,
                                                                            :expend_type_id,
                                                                            :expend_category_id,
                                                                            :payment_method_id,
                                                                            :prefix_id,
                                                                            :entity_type_id,
                                                                            :contributorname,
                                                                            :address,
                                                                            :city,
                                                                            :state_id,
                                                                            :zip,
                                                                            :amount,
                                                                            :date,
                                                                            :description,
                                                                            :isbenefitCOH,
                                                                            :istraveloutsidetx,
                                                                            :isreimbursementintended,:_destroy],
                                                  coh_payments_attributes: [:id,:campaign_finance_info_id,
                                                                            :expend_category_id,
                                                                            :prefix_id,
                                                                            :entity_type_id,
                                                                            :businessname,
                                                                            :address,
                                                                            :city,
                                                                            :state_id,
                                                                            :zip,
                                                                            :amount,
                                                                            :date,
                                                                            :description,
                                                                            :isbenefitCOH,
                                                                            :istraveloutsidetx,
                                                                            :isaustintxlivingexpense,:_destroy],
                                                  investment_purchases_attributes: [:id,:campaign_finance_info_id,
                                                                                    :prefix_id,
                                                                                    :entity_type_id,
                                                                                    :investorname,
                                                                                    :address,
                                                                                    :city,
                                                                                    :state_id,
                                                                                    :zip,
                                                                                    :amount,
                                                                                    :date,
                                                                                    :description,:_destroy],
                                                  credits_attributes: [:id,:campaign_finance_info_id,
                                                                       :prefix_id,
                                                                       :entity_type_id,
                                                                       :creditorname,
                                                                       :address,
                                                                       :city,
                                                                       :state_id,
                                                                       :zip,
                                                                       :amount,
                                                                       :date,
                                                                       :purpose,
                                                                       :isreturnedtofiler, :_destroy],
                                                  loans_attributes: [:id,:campaign_finance_info_id,
                                                                     :prefix_id,
                                                                     :entity_type_id,
                                                                     :lendername,
                                                                     :address,
                                                                     :city,
                                                                     :state_id,
                                                                     :zip,
                                                                     :isfinancialinstitution,
                                                                     :isoutofstatpac,
                                                                     :pacid,
                                                                     :amount,
                                                                     :interestrate,
                                                                     :date,
                                                                     :maturitydate,
                                                                     :collateraldescription,
                                                                     :ispersonalfunddeposit,:_destroy],
                                                  committee_notices_attributes: [:id,:campaign_finance_info_id,
                                                                         :committee_type_id,
                                                                         :name,
                                                                         :address,
                                                                         :city,
                                                                         :state_id,
                                                                         :zip,
                                                                         :_destroy],
                                                  travels_attributes: [:id,:campaign_finance_info_id,
                                                                       :name,
                                                                       :form_type_id,
                                                                       :travelbegin,
                                                                       :travelend,
                                                                       :prefix_id,
                                                                       :travelername,
                                                                       :departureloc,
                                                                       :destinationloc,
                                                                       :transportation,
                                                                       :purpose,:_destroy])
    end
end
