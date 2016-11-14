class CommitteeNoticesController < ApplicationController
  before_action :set_committee_notice, only: [:show, :edit, :update, :destroy]

  # GET /committee_notices
  # GET /committee_notices.json
  def index
    @committee_notices = CommitteeNotice.all
  end

  # GET /committee_notices/1
  # GET /committee_notices/1.json
  def show
  end

  # GET /committee_notices/new
  def new
    @committee_notice = CommitteeNotice.new
  end

  # GET /committee_notices/1/edit
  def edit
  end

  # POST /committee_notices
  # POST /committee_notices.json
  def create
    @committee_notice = CommitteeNotice.new(committee_notice_params)

    respond_to do |format|
      if @committee_notice.save
        format.html { redirect_to @committee_notice, notice: 'Committee notice was successfully created.' }
        format.json { render :show, status: :created, location: @committee_notice }
      else
        format.html { render :new }
        format.json { render json: @committee_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committee_notices/1
  # PATCH/PUT /committee_notices/1.json
  def update
    respond_to do |format|
      if @committee_notice.update(committee_notice_params)
        format.html { redirect_to @committee_notice, notice: 'Committee notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @committee_notice }
      else
        format.html { render :edit }
        format.json { render json: @committee_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committee_notices/1
  # DELETE /committee_notices/1.json
  def destroy
    @committee_notice.destroy
    respond_to do |format|
      format.html { redirect_to committee_notices_url, notice: 'Committee notice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee_notice
      @committee_notice = CommitteeNotice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committee_notice_params
      params.require(:committee_notice).permit(:campaign_finance_info_id, :committee_type_id, :name, :address, :city, :state_id, :zip)
    end
end
