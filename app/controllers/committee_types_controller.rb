class CommitteeTypesController < ApplicationController
  before_action :set_committee_type, only: [:show, :edit, :update, :destroy]

  # GET /committee_types
  # GET /committee_types.json
  def index
    @committee_types = CommitteeType.all
  end

  # GET /committee_types/1
  # GET /committee_types/1.json
  def show
  end

  # GET /committee_types/new
  def new
    @committee_type = CommitteeType.new
  end

  # GET /committee_types/1/edit
  def edit
  end

  # POST /committee_types
  # POST /committee_types.json
  def create
    @committee_type = CommitteeType.new(committee_type_params)

    respond_to do |format|
      if @committee_type.save
        format.html { redirect_to @committee_type, notice: 'Committee type was successfully created.' }
        format.json { render :show, status: :created, location: @committee_type }
      else
        format.html { render :new }
        format.json { render json: @committee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committee_types/1
  # PATCH/PUT /committee_types/1.json
  def update
    respond_to do |format|
      if @committee_type.update(committee_type_params)
        format.html { redirect_to @committee_type, notice: 'Committee type was successfully updated.' }
        format.json { render :show, status: :ok, location: @committee_type }
      else
        format.html { render :edit }
        format.json { render json: @committee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committee_types/1
  # DELETE /committee_types/1.json
  def destroy
    @committee_type.destroy
    respond_to do |format|
      format.html { redirect_to committee_types_url, notice: 'Committee type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee_type
      @committee_type = CommitteeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committee_type_params
      params.require(:committee_type).permit(:comtype)
    end
end
