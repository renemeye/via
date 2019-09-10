class MapController < ApplicationController
  after_action :allow_iframe

  def index
    @tarif = params[:tarif]
    @from = EndPoint.new(params[:from])
    @to = EndPoint.new(params[:to])

    @vias = parse_via_alternatives(params[:via]).map{|via| ViaChain.new(@from, via, @to)}

    @bounds = @vias.first.tarif_points.collect{|tarif_point| [tarif_point.longitude, tarif_point.latitude] if tarif_point.longitude}.reject(&:blank?).values_at(0,-1)
  end


  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def parse_via_alternatives(via)
    split_on_or(via)
  end

  OR_GROUP_REG_EXP = /(.*)\(([^(\/)]+)\/([^(\/)]+)\)(.*)/ #this one matches the ( x / y ) part and results the alternatives

  def split_on_or(via)
    if matches = via.match(OR_GROUP_REG_EXP)
      return [split_on_or(matches[1]+matches[2]+matches[4]), split_on_or(matches[1]+matches[3]+matches[4])].flatten
    else
      return [via]
    end
  end
end
