class StaticPagesController < ApplicationController
  def home
    @user = User.new()
    @json = Cause.all.to_gmaps4rails do |cause, marker|
      marker.infowindow render_to_string(:partial => "/causes/info_window", :locals => { :object => cause})
      img = cause.cause_category.present? ? ActionController::Base.helpers.asset_path(cause.cause_category.marker_address) : "http://www.google.com/mapfiles/dd-start.png"
      marker.picture({
                         :picture => img,
                         :width   => 32,
                         :height  => 32
                     })
      marker.title   "#{cause.name} (#{cause.cause_category.present? ? cause.cause_category.name : "Not yet categorized"})"
      marker.sidebar cause.name
      marker.json({ :id => cause.id, :category => cause.cause_category ? cause.cause_category.id : 0, data: cause.to_json})
    end
  end
end
