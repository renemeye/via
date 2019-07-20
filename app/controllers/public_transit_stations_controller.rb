class PublicTransitStationsController < ApplicationController
  before_action :set_public_transit_station, only: [:show, :edit, :update, :destroy]

  # GET /public_transit_stations
  # GET /public_transit_stations.json
  def index
    @public_transit_stations = PublicTransitStation.all
  end

  # GET /public_transit_stations/1
  # GET /public_transit_stations/1.json
  def show
  end

  # GET /public_transit_stations/new
  def new
    @public_transit_station = PublicTransitStation.new
  end

  # GET /public_transit_stations/1/edit
  def edit
  end

  # POST /public_transit_stations
  # POST /public_transit_stations.json
  def create
    @public_transit_station = PublicTransitStation.new(public_transit_station_params)

    respond_to do |format|
      if @public_transit_station.save
        format.html { redirect_to @public_transit_station, notice: 'Public transit station was successfully created.' }
        format.json { render :show, status: :created, location: @public_transit_station }
      else
        format.html { render :new }
        format.json { render json: @public_transit_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /public_transit_stations/1
  # PATCH/PUT /public_transit_stations/1.json
  def update
    respond_to do |format|
      if @public_transit_station.update(public_transit_station_params)
        format.html { redirect_to @public_transit_station, notice: 'Public transit station was successfully updated.' }
        format.json { render :show, status: :ok, location: @public_transit_station }
      else
        format.html { render :edit }
        format.json { render json: @public_transit_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_transit_stations/1
  # DELETE /public_transit_stations/1.json
  def destroy
    @public_transit_station.destroy
    respond_to do |format|
      format.html { redirect_to public_transit_stations_url, notice: 'Public transit station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_transit_station
      @public_transit_station = PublicTransitStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_transit_station_params
      params.require(:public_transit_station).permit(:dhid, :dtzid, :name, :latitude, :longitude)
    end
end
