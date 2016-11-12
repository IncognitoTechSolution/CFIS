class ContributionTypesController < ApplicationController
  before_action :set_contribution_type, only: [:show, :edit, :update, :destroy]

  # GET /contribution_types
  # GET /contribution_types.json
  def index
    @contribution_types = ContributionType.all
  end

  # GET /contribution_types/1
  # GET /contribution_types/1.json
  def show
  end

  # GET /contribution_types/new
  def new
    @contribution_type = ContributionType.new
  end

  # GET /contribution_types/1/edit
  def edit
  end

  # POST /contribution_types
  # POST /contribution_types.json
  def create
    @contribution_type = ContributionType.new(contribution_type_params)

    respond_to do |format|
      if @contribution_type.save
        format.html { redirect_to @contribution_type, notice: 'Contribution type was successfully created.' }
        format.json { render :show, status: :created, location: @contribution_type }
      else
        format.html { render :new }
        format.json { render json: @contribution_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contribution_types/1
  # PATCH/PUT /contribution_types/1.json
  def update
    respond_to do |format|
      if @contribution_type.update(contribution_type_params)
        format.html { redirect_to @contribution_type, notice: 'Contribution type was successfully updated.' }
        format.json { render :show, status: :ok, location: @contribution_type }
      else
        format.html { render :edit }
        format.json { render json: @contribution_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contribution_types/1
  # DELETE /contribution_types/1.json
  def destroy
    @contribution_type.destroy
    respond_to do |format|
      format.html { redirect_to contribution_types_url, notice: 'Contribution type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contribution_type
      @contribution_type = ContributionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contribution_type_params
      params.require(:contribution_type).permit(:contype)
    end
end
