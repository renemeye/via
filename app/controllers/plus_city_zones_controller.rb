class PlusCityZonesController < ApplicationController
  before_action :set_plus_city_zone, only: [:show, :edit, :update, :destroy]

  # GET /plus_city_zones
  # GET /plus_city_zones.json
  def index
    @plus_city_zones = PlusCityZone.all
  end

  # GET /plus_city_zones/1
  # GET /plus_city_zones/1.json
  def show
  end

  # GET /plus_city_zones/new
  def new
    @plus_city_zone = PlusCityZone.new
  end

  # GET /plus_city_zones/1/edit
  def edit
  end

  # POST /plus_city_zones
  # POST /plus_city_zones.json
  def create
    @plus_city_zone = PlusCityZone.new(plus_city_zone_params)

    respond_to do |format|
      if @plus_city_zone.save
        format.html { redirect_to @plus_city_zone, notice: 'Plus city zone was successfully created.' }
        format.json { render :show, status: :created, location: @plus_city_zone }
      else
        format.html { render :new }
        format.json { render json: @plus_city_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plus_city_zones/1
  # PATCH/PUT /plus_city_zones/1.json
  def update
    respond_to do |format|
      if @plus_city_zone.update(plus_city_zone_params)
        format.html { redirect_to @plus_city_zone, notice: 'Plus city zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @plus_city_zone }
      else
        format.html { render :edit }
        format.json { render json: @plus_city_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plus_city_zones/1
  # DELETE /plus_city_zones/1.json
  def destroy
    @plus_city_zone.destroy
    respond_to do |format|
      format.html { redirect_to plus_city_zones_url, notice: 'Plus city zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plus_city_zone
      @plus_city_zone = PlusCityZone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plus_city_zone_params
      params.require(:plus_city_zone).permit(:dtzid, :city_name)
    end
end
