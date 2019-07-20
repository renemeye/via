class TarifPointsController < ApplicationController
  before_action :set_tarif_point, only: [:show, :edit, :update, :destroy]

  # GET /tarif_points
  # GET /tarif_points.json
  def index
    @tarif_points = TarifPoint.all
  end

  # GET /tarif_points/1
  # GET /tarif_points/1.json
  def show
  end

  # GET /tarif_points/new
  def new
    @tarif_point = TarifPoint.new
  end

  # GET /tarif_points/1/edit
  def edit
  end

  # POST /tarif_points
  # POST /tarif_points.json
  def create
    @tarif_point = TarifPoint.new(tarif_point_params)

    respond_to do |format|
      if @tarif_point.save
        format.html { redirect_to @tarif_point, notice: 'Tarif point was successfully created.' }
        format.json { render :show, status: :created, location: @tarif_point }
      else
        format.html { render :new }
        format.json { render json: @tarif_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarif_points/1
  # PATCH/PUT /tarif_points/1.json
  def update
    respond_to do |format|
      if @tarif_point.update(tarif_point_params)
        format.html { redirect_to @tarif_point, notice: 'Tarif point was successfully updated.' }
        format.json { render :show, status: :ok, location: @tarif_point }
      else
        format.html { render :edit }
        format.json { render json: @tarif_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarif_points/1
  # DELETE /tarif_points/1.json
  def destroy
    @tarif_point.destroy
    respond_to do |format|
      format.html { redirect_to tarif_points_url, notice: 'Tarif point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarif_point
      @tarif_point = TarifPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarif_point_params
      params.require(:tarif_point).permit(:name, :ibnr, :status, :network, :regions, :equality_treatments)
    end
end
