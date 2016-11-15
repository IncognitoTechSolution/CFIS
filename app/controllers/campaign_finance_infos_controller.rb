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

    respond_to do |format|
      if @campaign_finance_info.save
        format.html { redirect_to @campaign_finance_info, notice: 'Campaign finance info was successfully created.' }
        format.json { render :show, status: :created, location: @campaign_finance_info }
      else
        format.html { render :new }
        format.json { render json: @campaign_finance_info.errors, status: :unprocessable_entity }
      end
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
