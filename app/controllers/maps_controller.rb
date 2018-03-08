class MapsController < ApplicationController

  def index
    @maps = History.includes(:image).where(exclude_from_map: false).where.not(latitude: nil).where.not(longitude: nil)
    authorize @maps
    @hash = Gmaps4rails.build_markers(@maps) do |map, marker|
      marker.infowindow render_to_string(partial: "/maps/infowindow", locals:  { object: map})
      marker.json({ id: map.id })
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
    @map = History.includes(:image).friendly.find(params[:id])
    authorize @map
  end

end
