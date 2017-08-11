class MapsController < ApplicationController

  def index
    @maps = History.where(exclude_from_map: false).where.not(latitude: nil).where.not(longitude: nil).limit(10)
    authorize @maps
    @hash = Gmaps4rails.build_markers(@maps) do |map, marker|
      marker.infowindow render_to_string(partial: "/maps/infowindow", locals:  { object: map})
      marker.lat map.latitude
      marker.lng map.longitude
      marker.title map.title
      marker.picture({url: ActionController::Base.helpers.asset_path('mapmarker.png'),
      width: 20,
      height: 20
      })
    end
  end

  def show
    @map = History.friendly.find(params[:id])
    authorize @map
  end

end
