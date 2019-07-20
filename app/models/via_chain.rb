class ViaChain
  def initialize(from_end_point, via_string, to_end_point)
    @from_end_point = from_end_point
    @via_string = via_string
    @to_end_point = to_end_point
  end

  def via_abbreviations
    @via_string.split('*')
  end

  def tarif_points
    @tarif_points ||= [@from_end_point.tarif_point, via_tarif_points, @to_end_point.tarif_point].flatten # plus start and end
  end

  def via_tarif_points
    @via_tarif_points ||= via_abbreviations.map{|abbreviation| TarifPoint.find_by(abbreviation: abbreviation)}
  end

  def geojson
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "type": "LineString",
        "coordinates": tarif_points.collect{|tarif_point| [tarif_point.longitude, tarif_point.latitude] if tarif_point.longitude}.reject(&:blank?)
      }
    }
  end

  # def tarif_kilometers
  #   @tarif_kilometers = tarif_points
  #     .each_cons(2)
  #     .collect{|point_1,point_2| [point_1.ibnr, point_2.ibnr]}
  #     # .collect{|ibnrs|
  #     #   TarifDistance.where(from_ibnr: ibnrs[0], to_ibnr: ibnrs[1]).first || TarifDistance.where(from_ibnr: ibnrs[1], to_ibnr: ibnrs[0]).first
  #     # }
  # end


  attr_accessor :via_string
end
