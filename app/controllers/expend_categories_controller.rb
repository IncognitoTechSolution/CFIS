class ExpendCategoriesController < ApplicationController
  before_action :set_expend_category, only: [:show, :edit, :update, :destroy]

  # GET /expend_categories
  # GET /expend_categories.json
  def index
    @expend_categories = ExpendCategory.all
  end

  # GET /expend_categories/1
  # GET /expend_categories/1.json
  def show
  end

  # GET /expend_categories/new
  def new
    @expend_category = ExpendCategory.new
  end

  # GET /expend_categories/1/edit
  def edit
  end

  # POST /expend_categories
  # POST /expend_categories.json
  def create
    @expend_category = ExpendCategory.new(expend_category_params)

    respond_to do |format|
      if @expend_category.save
        format.html { redirect_to @expend_category, notice: 'Expend category was successfully created.' }
        format.json { render :show, status: :created, location: @expend_category }
      else
        format.html { render :new }
        format.json { render json: @expend_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expend_categories/1
  # PATCH/PUT /expend_categories/1.json
  def update
    respond_to do |format|
      if @expend_category.update(expend_category_params)
        format.html { redirect_to @expend_category, notice: 'Expend category was successfully updated.' }
        format.json { render :show, status: :ok, location: @expend_category }
      else
        format.html { render :edit }
        format.json { render json: @expend_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expend_categories/1
  # DELETE /expend_categories/1.json
  def destroy
    @expend_category.destroy
    respond_to do |format|
      format.html { redirect_to expend_categories_url, notice: 'Expend category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expend_category
      @expend_category = ExpendCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expend_category_params
      params.require(:expend_category).permit(:expenctype)
    end
end
