class EqualitiesController < ApplicationController
  before_action :set_equality, only: [:show, :edit, :update, :destroy]

  # GET /equalities
  # GET /equalities.json
  def index
    @equalities = Equality.all
  end

  # GET /equalities/1
  # GET /equalities/1.json
  def show
  end

  # GET /equalities/new
  def new
    @equality = Equality.new
  end

  # GET /equalities/1/edit
  def edit
  end

  # POST /equalities
  # POST /equalities.json
  def create
    @equality = Equality.new(equality_params)

    respond_to do |format|
      if @equality.save
        format.html { redirect_to @equality, notice: 'Equality was successfully created.' }
        format.json { render :show, status: :created, location: @equality }
      else
        format.html { render :new }
        format.json { render json: @equality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equalities/1
  # PATCH/PUT /equalities/1.json
  def update
    respond_to do |format|
      if @equality.update(equality_params)
        format.html { redirect_to @equality, notice: 'Equality was successfully updated.' }
        format.json { render :show, status: :ok, location: @equality }
      else
        format.html { render :edit }
        format.json { render json: @equality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equalities/1
  # DELETE /equalities/1.json
  def destroy
    @equality.destroy
    respond_to do |format|
      format.html { redirect_to equalities_url, notice: 'Equality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equality
      @equality = Equality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equality_params
      params.require(:equality).permit(:tarif_point_name, :ibnr, :equality_type, :min_km, :price_forming_tarif_point_name, :price_forming_tarif_point_ibnr, :collective_name)
    end
end
