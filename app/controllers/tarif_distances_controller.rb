class TarifDistancesController < ApplicationController
  before_action :set_tarif_distance, only: [:show, :edit, :update, :destroy]

  # GET /tarif_distances
  # GET /tarif_distances.json
  def index
    @tarif_distances = TarifDistance.all
  end

  # GET /tarif_distances/1
  # GET /tarif_distances/1.json
  def show
  end

  # GET /tarif_distances/new
  def new
    @tarif_distance = TarifDistance.new
  end

  # GET /tarif_distances/1/edit
  def edit
  end

  # POST /tarif_distances
  # POST /tarif_distances.json
  def create
    @tarif_distance = TarifDistance.new(tarif_distance_params)

    respond_to do |format|
      if @tarif_distance.save
        format.html { redirect_to @tarif_distance, notice: 'Tarif distance was successfully created.' }
        format.json { render :show, status: :created, location: @tarif_distance }
      else
        format.html { render :new }
        format.json { render json: @tarif_distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarif_distances/1
  # PATCH/PUT /tarif_distances/1.json
  def update
    respond_to do |format|
      if @tarif_distance.update(tarif_distance_params)
        format.html { redirect_to @tarif_distance, notice: 'Tarif distance was successfully updated.' }
        format.json { render :show, status: :ok, location: @tarif_distance }
      else
        format.html { render :edit }
        format.json { render json: @tarif_distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarif_distances/1
  # DELETE /tarif_distances/1.json
  def destroy
    @tarif_distance.destroy
    respond_to do |format|
      format.html { redirect_to tarif_distances_url, notice: 'Tarif distance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarif_distance
      @tarif_distance = TarifDistance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarif_distance_params
      params.require(:tarif_distance).permit(:from_name, :from_ibnr, :to_name, :to_ibnr, :tarif_kilometer, :bus, :around, :exclusion_way, :region)
    end
end
