class EndPoint
  def initialize(end_point_text)
    @end_point_text = end_point_text
  end

  def tarif_point
    if is_exact_tarif_point?
      TarifPoint.find_by(name: end_point_name)
    elsif is_equality_collection?
      TarifPoint.find_by(ibnr: Equality.where(collective_name: end_point_name).first.price_forming_tarif_point_ibnr)
    else
      nil
    end
  end

  def equalities
    if is_equality_collection? && is_city_ticket?
      Equality.where(collective_name: end_point_name)
    elsif is_equality_collection?
      Equality.where(collective_name: end_point_name, equality_type: "TARIF")
    elsif is_city_ticket?
      Equality.where(collective_name: end_point_name, equality_type: "CITY")
    else
      []
    end
  end

  def city_ticket
    if is_city_ticket? && plus_city_zone = PlusCityZone.find_by(city_name: @end_point_text)
      PublicTransitStation.where(dtzid: plus_city_zone.dtzid).collect{|public_transit_station|
        {
          "type": "Feature",
          "properties": {},
          "geometry": {
            "type": "Point",
            "coordinates": [public_transit_station.longitude, public_transit_station.latitude]
          }
        }
      }
    else
      []
    end
  end

  def equality_geojson
    if is_equality_collection?
      equalities.collect{|equality|
        tarif_point = TarifPoint.find_by(ibnr: equality.ibnr)
        {
          "type": "Feature",
          "properties": {},
          "geometry": {
            "type": "Point",
            "coordinates": [tarif_point.longitude, tarif_point.latitude]
          }
        }
      }
    else
      []
    end
  end

  def end_point_name
    @end_point_text.split("+City")[0]
  end

  def is_city_ticket?
    @end_point_text.ends_with?("+City")
  end

  def is_equality_collection?
    Equality.where(collective_name: end_point_name).count > 0
  end

  def is_exact_tarif_point?
    TarifPoint.find_by(name: end_point_name) != nil
  end

end
