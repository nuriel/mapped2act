class MapController < ApplicationController
  respond_to :json

  def index
  end

  def autocomplete
    unless params[:q].blank?
      s = Geocoder.search(params[:q])
      render json: s[0..6].map { |l| {text: l.data["formatted_address"], id: l.data['geometry']['location'] } }
    end

  end

  def geolocate
    render json: {text: "#{request.location.city}, #{request.location.country}", id: "#{request.location.city}, #{request.location.country}"}

  end
end
